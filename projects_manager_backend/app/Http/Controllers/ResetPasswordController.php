<?php

namespace App\Http\Controllers;

use App\Http\Requests\ForgetPasswordRequest;
use App\Http\Requests\ResetPasswordRequest;
use App\Models\Admin;
use App\Models\Doctor;
use App\Models\Student;
use App\Notifications\ResetPasswordNotification;
use Ichtrojan\Otp\Otp;
use Illuminate\Support\Facades\Hash;

/**
 * @group Password
 * 
 * 
 */
class ResetPasswordController extends Controller
{
    /**
     * Forget password
     * 
     * This endpoint allows users (admins , doctors and students) to request a OTP code to update password
     * 
     * @bodyParam role string required Role of current user . Enum:admin , doctor , student . Example:admin
     * @bodyParam email string required Email of current user .
     */
    public function forgetPassword(ForgetPasswordRequest $request)
    {
        $validation = $request->validated();

        $currentUser = null;
        if ($validation['role'] == 'admin') {
            $currentUser = Admin::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'error' => "No admin with this email ."
                    ],
                    422
                );
            }
        } else if ($validation['role'] == 'doctor') {
            $currentUser = Doctor::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'error' => "No doctor with this email ."
                    ],
                    422
                );
            }
        } else if ($validation['role'] == 'student') {
            $currentUser = Student::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'error' => "No student with this email ."
                    ],
                    422
                );
            }
        }

        if (!$currentUser) {
            return response()->json(
                [
                    'error' => "Email does not exist"
                ],
                422
            );
        }
        $currentUser->notify(new ResetPasswordNotification());
        return response()->json(
            [
                "success" => true , 
                'msg' => "OTP code has been sent to the email"
            ],
            200
        );
    }

    /**
     * Reset Password
     * 
     * This endpiont allows users to update the password
     * 
     * @bodyParam role string required Role of current user . Enum:admin , doctor , student . Example:admin
     * @bodyParam email string required Email of current user .
     * @bodyParam otp_code string required OTP code which has been sent to email . 
     * @bodyParam new_password string required New password 
     */
    public function resetPassword(ResetPasswordRequest $request)
    {
        $validation = $request->validated();
        $otp = new Otp;
        $otpCode = $otp->validate($validation['email'], $validation['otp_code']);


        if (!$otpCode->status) {

            return response()->json(
                [
                    'success' => false ,
                    'error' => $otpCode
                ],
                401
            );
        }

        $currentUser = null;
        if ($validation['role'] == 'admin') {
            $currentUser = Admin::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'success' => false ,
                        'error' => "No admin with this email ."
                    ],
                    422
                );
            }
        } else if ($validation['role'] == 'doctor') {
            $currentUser = Doctor::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'success' => false ,
                        'error' => "No doctor with this email ."
                    ],
                    422
                );
            }
        } else if ($validation['role'] == 'student') {
            $currentUser = Student::where('email', $validation['email'])->first();
            if (!$currentUser) {
                return response()->json(
                    [
                        'success' => false ,
                        'error' => "No student with this email ."
                    ],
                    422
                );
            }
        }

        if (!$currentUser) {
            return response()->json(
                [
                    'error' => "Email does not exist"
                ],
                422
            );
        }

        $currentUser->update(['password' => Hash::make($validation['new_password'])]);
        $currentUser->tokens()->delete();

        return response()->json(
            [
                'success' => true,
                'msg' => "Password updated successfully"
            ],
            200
        );
    }
}
