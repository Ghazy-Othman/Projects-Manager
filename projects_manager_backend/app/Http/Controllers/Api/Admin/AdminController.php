<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\AddDoctorRequest;
use App\Http\Requests\UpdateFormRulesRequest;
use App\Http\Requests\UploadFileRequest;
use App\Http\Resources\AdminCollection;
use App\Http\Resources\AdminResource;
use App\Http\Resources\DoctorResource;
use App\Http\Resources\StudentCollection;
use App\Imports\StudentsImport;
use App\Models\Admin;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Str;
use App\Models\Doctor;
use App\Models\Student;
use App\Notifications\AddDoctorNotification;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

/**
 * @group Admin
 * 
 * @subgroup actions
 * @subgroupDescription API for admin functinos
 */
class AdminController extends Controller
{

    /**
     * Get all admins
     * 
     * @queryParam section string Admin section. Enum:softwar , network Example: software
     */
    public function index(Request $request)
    {

        $section = $request->query('section');
        if (!$section) {
            return new AdminCollection(Admin::all());
        }
        $admins = Admin::where('section', $section)->get();
        return new AdminCollection($admins);
    }


    /**
     * Get specific admin 
     */
    public function show(Admin $admin)
    {
        return new AdminResource($admin);
    }


    /**
     * Add new doctor
     * 
     * 
     * @bodyParam first_name string required Doctor's first name . Example: Ali
     * @bodyParam last_name string required Doctor's last name . Example: Mohammad
     * @bodyParam email string required Doctor's email . Example: alimo@gmail.com
     * @bodyParam section string required Doctor's section . Example: software
     * 
     * @authenticated
     */
    public function addNewDoctor(AddDoctorRequest $request)
    {
        $validation = $request->validated();

        $admin = Admin::find(Auth::user()->admin_id);

        $genPassword = Str::password(10, true, true, true, false);
        $newDoctor = Doctor::create([
            'first_name' => $validation['first_name'],
            'last_name' => $validation['last_name'],
            'email' => $validation['email'],
            'password' =>  Hash::make("123456789"), // TODO : Replace it with [$genPassword]
            'section' => $validation['section'],
            'max_number_of_groups' => $admin->max_doctor_groups,
            'status' => 'Inactive '
        ]);

        $success['success'] = true;
        $success['doctor'] = new DoctorResource($newDoctor);
        $newDoctor->notify(new AddDoctorNotification("123456789", $admin->first_name)); // TODO : Replace it with [$genPassword]
        return response()->json($success, 200);
    }


    /**
     * Upload file
     * 
     * Upload file contain students info 
     * 
     * @bodyParam students file required students info file .
     * 
     * @authenticated
     */
    public function uploadFile(UploadFileRequest $request)
    {   
        
        // Add students info into (Students) table
        Excel::import(new StudentsImport, $request->file('students'));
        
        return response()->json(
            [
                'success' => true,
                'data' => new StudentCollection(Student::all())
            ],
            200
        );
    }


    /**
     * Edit form rules
     * 
     * Add and update form rules . 
     * 
     * @bodyParam mix boolean required true for mix ability . 
     * @bodyParam min_number int required min number of students in a group .
     * @bodyParam max_number int required max number of students in a group .
     * @bodyParam max_doctor_groups int required max number of groups for a doctor
     * 
     * @authenticated
     */
    public function updateFormRules(UpdateFormRulesRequest $request)
    {

        // Check validation for request input 
        $validation = $request->validated();

        // Update rules
        $admin = Admin::find(Auth::user()->admin_id);
        $admin->mix = $validation['mix'] == 'true' ? true : false;
        
        $otherAdmin = $admin->section == 'software' ? Admin::where('section' , "network")->first() : Admin::where('section' , "software")->first() ;
        if($otherAdmin){
            $otherAdmin->mix = $admin->mix;
            $otherAdmin->save() ;
        }
 
        $admin->min_number = $validation['min_number'];
        $admin->max_number = $validation['max_number'];
        $admin->max_doctor_groups = $validation['max_doctor_groups'];

        // update max number of groups for all doctors 
        Doctor::where('section' , $admin->section)->update(['max_number_of_groups' => $admin->max_doctor_groups]) ;

        // Save new info
        $admin->save();
        


        // Return response
        return response()->json(
            [
                'success' => true,
                'form_rules' => [
                    'mix' => $admin->mix,
                    'min_number_of_students' => $admin->min_number,
                    'max_number_of_students' => $admin->max_number,
                    'max_doctor_groups' => $admin->max_doctor_groups
                ]
            ],
            200
        );
    }
}
