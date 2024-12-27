<?php

namespace App\Http\Controllers;

use App\Http\Requests\SendProjectRequest;
use App\Http\Requests\UpdateProjectRequest;
use App\Models\Group;
use Illuminate\Http\Request;
use App\Models\Project;
use App\Models\ProjectRequest;
use App\Models\Student;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

/**
 * @group Projects
 * 
 */
class ProjectRequestController extends Controller
{
    /**
     * Send project request 
     * 
     * Make new project request and send it to specific doctor .
     * This action should be done by student who is a group admin .
     * 
     * @bodyParam doctor_id int The ID of doctor . Example:1
     * @bodyParam project_title string Title for new project . Example:Projects Manager
     * @bodyParam project_about string About the project . Example:This is our new project
     * @authenticated
     */
    public function sendProjectRequest(SendProjectRequest $request)
    {
        //TODO : Add some rules for who can use this API
        
        $validation = $request->validated();

        $currentStudent = Student::find(Auth::user()->student_id);

        $group = Group::find($currentStudent->group_id);

        $newProjectRequest = ProjectRequest::create(
            [
                'group_id' => $group->group_id,
                'doctor_id' => $validation['doctor_id'],
                'project_title' => $validation['project_title'],
                'project_about' => $validation['project_about'],
                'status' => 2 ,
            ]
        );


        return response()->json(
            [
                'success' => true ,
                'msg' => "Project request had been sent successfully to doctor with id " . $request->doctor_id,
                'project_requrest' => $newProjectRequest
            ],
            200
        );
    }


    /**
     * Update project request 
     * 
     * Accept or reject existing project request .
     * This action should done by doctor who this project request was sent to him 
     * 
     * @bodyParam project_request_id int ID for this project request.
     * @bodyParam new_status int New status for this project request . Enum: 0 , 1 . Example:1
     * 
     * @authenticated
     * 
     */
    public function updateProjectRequestState(UpdateProjectRequest $request)
    {   
        //TODO : Add some rules for who can use this API

        $validation = $request->validated();


        if ($validation['new_status'] == 0) {
            $currenProjectRequest = ProjectRequest::find($validation['project_request_id']);
            $currenProjectRequest->status = 0;
            $currenProjectRequest->save();
            
            return response()->json(
                [
                    'success' => true , 
                    'status_code' => 200,
                    'msg' => "Project request was rejected by doctor"
                ],
                200
            );
        } else if ($validation['new_status'] == 1) {
            
            $currenProjectRequest = ProjectRequest::find($validation['project_request_id']);
            $currenProjectRequest->status = 1;
            $currenProjectRequest->save();

            $group = Group::find($currenProjectRequest->group_id);
            $newProject = Project::create(
                [
                    'title' => $currenProjectRequest->project_title,
                    'about' => $currenProjectRequest->project_about
                ]
            );


            $group->doctor_id = $currenProjectRequest->doctor_id;
            $group->project_id = $newProject->project_id;
            $group->save();

            return response()->json(
                [
                    'success' => true,
                    'msg' => "Project request was accepted by doctor",
                    'project_request' => $currenProjectRequest,
                    'project' => $newProject
                ],
                200
            );
        }
    }
}
