<?php

namespace App\Http\Controllers;

use App\Http\Resources\GroupCollection;
use App\Http\Resources\GroupResource;
use App\Models\Group;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

/**
 * @group Groups
 * 
 */
class GroupController extends Controller
{

    /**
     * Get all groups
     * 
     */
    public function index() {
        return new GroupCollection(Group::all());
    }

    /**
     * Get specific group 
     * 
     */
    public function show (Group $group) {
        return [
            'group' => new GroupResource($group)
        ];
    }


    /**
     * Create new group
     * @authenticated
     */
    public function createGroup()
    {
        $currentStudent = Student::find(Auth::user()->student_id); 

    
        $group = Group::create(
            ['student_id' => $currentStudent->student_id]
        );

        $currentStudent->group_id = $group->group_id;
        $currentStudent->save();

        return response()->json(
            [
                'success' => true , 
                'group' => new GroupResource($group)
            ],
            200
        );
    }
}
