<?php

namespace App\Http\Controllers;

use App\Models\AddRequests;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

/**
 * @group Add Requests
 * 
 * APIs for managing groups add requests .
 */
class AddRequestsController extends Controller
{
    /**
     * New add request
     * 
     * This endpoint allows students to send add requet to other students to join a group .
     * 
     * @bodyParam group_id int required The id of group .
     * @bodyParam reciver_student_id int required The id of the student who will recive the request .
     * @authenticated
     */
    public function sendAddRequest(Request $request)
    {
        // Check for input validation 
        $validation = Validator::make(
            $request->all(),
            [
                'group_id' => 'required',
                'receiver_students' => 'required'
            ],
            [
                'group_id.required' => 'Group ID is needed .',
                'receiver_students.required' => 'Reciver students is needed .',
            ]

        );

        //
        if ($validation->fails()) {

            return response()->json([
                'status_code' => 422,
                'success' => false,
                'errors' => $validation->errors()
            ], 422);
        }

        $senderStudent = Student::find(Auth::user()->student_id);
        
        $receiver_students = json_decode($request->receiver_students) ;
        foreach($receiver_students as $student) {
            
            $newAddRequest = AddRequests::create(
                [
                    'group_id' => $request->group_id,
                    'sender_student_id' => $senderStudent->student_id,
                    'reciver_student_id' => $student->receiver_student_id,
                ]
            );
        }



        return response()->json(
            [
                "status_code" => 200,
                "success" => true,
                "msg" => "Add requests had been sent to students successfully"
            ],
            200
        );
    }


    /**
     * Update add request
     * 
     * This endpoint allows students to accept or reject add requet from other students to join a group .
     * 
     * @bodyParam add_request_id int required The id request .
     * @bodyParam new_status int required New status value . Enum: 0 , 1 
     * @authenticated
     */
    public function updateAddRequest(Request $request)
    {

        $validation = Validator::make(
            $request->all(),
            [
                'add_request_id' => 'required',
                'new_status' => 'required'
            ],
            [
                'add_request_id.required' => "Add request ID is needed .",
                'new_status.required' => "New status value is needed .",
            ]
        );



        if ($validation->fails()) {
            return response()->json([
                'status_code' => 422,
                'success' => false,
                'errors' => $validation->errors()
            ], 422);
        }

        // Update add request by its (id)
        $addRequest = AddRequests::find($request->add_request_id);


        // If student reject the add request 
        if ($request->new_status == 0) {
            $addRequest->status = 0;
            $addRequest->save();

            return response()->json(
                [
                    'success' => true,
                    'msg' => "Add request was rejected"
                ],
                200
            );
        }


        // If student accept the add request 
        if ($request->new_status == 1) {

            $addRequest->status = 1;
            $addRequest->save();

            $student = Student::find(Auth::user()->student_id);
            $student->group_id  = $addRequest->group_id;

            $student->save();

            $addreqs = AddRequests::where("reciver_student_id" , $student->student_id)->where('add_request_id' ,'!=' , $addRequest->add_request_id)->update(['status' => 0]);

            return response()->json(
                [
                    'success' => true , 
                    'msg' => "Add request was accepted",
                ],
                200
            );
        }
    }


    



}
