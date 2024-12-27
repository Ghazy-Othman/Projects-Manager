<?php

namespace App\Http\Controllers\Api\Student;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\LoginStudentRequest;
use App\Http\Requests\Api\Auth\RegisterStudentRequest;
use App\Http\Requests\StudentValidationRequest;
use App\Http\Resources\StudentResource;
use App\Models\Student;
use Illuminate\Support\Facades\Hash;

/**
 * @group Student
 * 
 * @subgroup Auth
 * @subgroupDescription Student Auth
 */
class StudentAuthController extends Controller
{

    public function studentVerification(StudentValidationRequest $request) {

        $validation = $request->validated();
        $credentials = [ 
            'ssn' => $request->ssn , 
            'university_id' => $request->university_id , 
            'section' => $request->section , 
            'year_of_study' => $request->year_of_study
        ] ;

        $currentStudent = Student::firstWhere($credentials) ;

        if($currentStudent != null) {
            $success['success'] = true ; 
            $success["msg"] = "Students exists" ;
            $success['student_id'] = $currentStudent->student_id ;
            return response()->json($success , 200) ;
        }
        else {
            return response()->json(
                [
                    'success' => false,
                    'error' => 'Unauthorized'
                ],
                401
            );
        }



    }


    /**
     * Student Register
     * 
     * Make new account for student .
     * 
     * @bodyParam first_name string required Student's first name . Example: Ali
     * @bodyParam mid_name string required Student's mid name . Example: Hani
     * @bodyParam last_name string required Student's last name . Example: Mohammad
     * @bodyParam email string required Student's email . Example: alimo@gmail.com
     * @bodyParam password string required Student's password . Example: 4&svd&f
     * 
     */
    public function studentRegister(RegisterStudentRequest $request)
    {

        $validation = $request->validated();


        $currentStudent = Student::find($request->student_id);

        // Check if student exists with this credentials 
        if ($currentStudent != null) {

            // Update email and password , then save new info
            $currentStudent->email = $validation['email'];
            $currentStudent->first_name = $validation['first_name'] ;
            $currentStudent->mid_name = $validation['mid_name'] ;
            $currentStudent->last_name = $validation['last_name'] ;

            $currentStudent->password = Hash::make($validation['password']);
            $currentStudent->save();

            $success['success'] = true;
            $success['token'] = $currentStudent->createToken("STUDENT")->plainTextToken;
            $success['student'] = new StudentResource($currentStudent);

            return response()->json($success, 200);
        } else {
            return response()->json(
                [
                    'success' => false,
                    'msg' => "Wrong id" ,
                    'error' => 'Unauthorized'
                ],
                401
            );
        }
    }



    /**
     * Student Login
     * 
     * 
     * 
     * @bodyParam email string required Student's email . Example: alimo@gmail.com
     * @bodyParam password string required Student's password . Example: 4&svd&f
     * @bodyParam section string required Student's section . Example: software
     * @bodyParam year_of_study int required Student's year of study . Example: 4
     * 
     */
    public function studentLogin(LoginStudentRequest $request)
    {

        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'section' => $request->section,
            'year_of_study' => $request->year_of_study
        ];

        if (auth()->guard('student')->attempt($credentials)) {

            // Get current student
            $student = Student::find(auth()->guard('student')->user()->student_id);

            // Delete all old tokens for current student and create new token 
            $student->tokens()->delete();

            $success['success'] = true;
            $success['token'] =  $student->createToken("STUDENT")->plainTextToken;
            $success['student'] = new StudentResource($student);

            return response()->json($success, 200);
        } else {

            return response()->json([
                'success' => false,
                'error' => "Unauthorized"
            ], 401);
        }
    }
}
