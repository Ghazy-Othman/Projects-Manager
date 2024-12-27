<?php

namespace App\Http\Controllers\Api\Doctor;

use App\Http\Controllers\Controller;
use App\Http\Resources\DoctorCollection;
use App\Http\Resources\DoctorResource;
use App\Models\Admin;
use App\Models\Doctor;
use App\Models\Student;
use Illuminate\Http\Request;
/**
 * @group Doctor
 * 
 */
class DoctorController extends Controller
{
    /**
     * Get all doctors
     * 
     * @queryParam section string Doctor section . Enum: software , network Example: network
     */
    public function index(Request $request){
        
        $studentId = $request->query("student_id") ;
        if($studentId) {
            $student = Student::find($studentId) ;
            $studetnAdmin = Admin::where('section' , $student->section)->first() ;
            if($studetnAdmin->mix) { 
                return new DoctorCollection(Doctor::all());
            }
            else {
                $doctors = Doctor::where('section' , $student->section)->get() ;
        
                return new DoctorCollection($doctors);
            }

        }
        
        $section = $request->query('section'); 
        if(!$section){
            return new DoctorCollection(Doctor::all());
        }        

        $doctors = Doctor::where('section' , $section )->get() ;
        
        return new DoctorCollection($doctors);
    }

    /**
     * Get specific doctor
     */
    public function show(Doctor $doctor){
        return new DoctorResource($doctor) ;
    }

}
