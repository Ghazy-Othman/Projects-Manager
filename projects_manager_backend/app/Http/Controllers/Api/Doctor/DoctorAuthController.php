<?php

namespace App\Http\Controllers\Api\Doctor;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\LoginDoctorRequest;
use App\Http\Resources\DoctorResource;
use App\Models\Doctor;

/**
 * @group Doctor
 * 
 * @subgroup Auth
 * @subgroupDescription Doctor Auth
 */
class DoctorAuthController extends Controller
{

    /**
     * Doctor login
     * 
     * 
     * @bodyParam email string required Doctor's email . Example: alimo@gmail.com
     * @bodyParam password string required Doctor's password . Example: 4&svd&f
     * @bodyParam section string required Doctor's section . Example: software
     */
    public function doctorLogin(LoginDoctorRequest $request)
    {

        // Get credentials from validated request
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'section' => $request->section,
        ];


        if (auth()->guard('doctor')->attempt($credentials)) {

            // Get current doctor
            $doctor = Doctor::find(auth()->guard('doctor')->user()->doctor_id);
            
            // Delete all old tokens for current doctor
            $doctor->tokens()->delete();
            
            // Change the status of current doctor to active 
            $doctor->status = "Active" ;

            $doctor->save() ;
            // Create new token for current doctor 
            $success['token'] = $doctor->createToken("ADMIN")->plainTextToken;

            $success['success'] = true;
            $success['doctor'] = new DoctorResource($doctor);


            return response()->json($success, 200);
        } else {
            return response()->json(
                [
                    'success' => false,
                    'error' => 'Unauthorized'
                ],
                401
            );
        }
    }
}
