<?php

namespace App\Http\Controllers\Api\Student;

use App\Http\Controllers\Controller;
use App\Http\Resources\StudentCollection;
use App\Http\Resources\StudentResource;
use App\Models\Admin;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
 * @group Student
 * 
 */
class StudentController extends Controller
{
    /**
     * Get all students 
     * 
     * @queryParam section string Studens section . Enum: software , network Example: software
     * @queryParam year_of_study int Students year of study. Enum: 4 , 5 Example: 4
     * @queryParam has_group int If student has group. Enum: 0 ,1 .Example: 1 
     */
    public function index(Request $request)
    {

        //
        $current_student = Student::find($request->query("student_id"));
        $student_admin = Admin::where('section', $current_student->section)->first();

        $all_students = [];

        if ($student_admin->mix == false) {
            $all_students = Student::where('year_of_study', $current_student->year_of_study)
                ->where('section', $current_student->section)
                ->whereNull('group_id')
                ->where('student_id', '!=', $current_student->student_id)->get();
        } else {
            $all_students = Student::where('year_of_study', $current_student->year_of_study)
                ->whereNull('group_id')
                ->where('student_id', '!=', $current_student->student_id)->get();
        }


        return response()->json([
            'success' => true,
            'students' => $all_students
        ]);
    }

    /**
     * Get specific student 
     */
    public function show(Student $student)
    {
        return new StudentResource($student);
    }
}
