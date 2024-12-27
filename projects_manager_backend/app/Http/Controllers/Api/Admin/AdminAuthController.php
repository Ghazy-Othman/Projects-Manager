<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Auth\LoginAdminRequest;
use App\Http\Requests\Api\Auth\RegisterAdminRequest;
use App\Http\Resources\AdminResource;
use App\Models\Admin;
use Illuminate\Support\Facades\Hash;

/**
 * @group Admin
 * 
 * @subgroup Auth
 * @subgroupDescription Admin Auth
 */
class AdminAuthController extends Controller
{

    /**
     * Admin Register
     * 
     * Make new account for admins .
     * 
     * @bodyParam first_name string required Admin's first name . Example: Ali
     * @bodyParam last_name string required Admin's last name . Example: Mohammad
     * @bodyParam email string required Admin's email . Example: alimo@gmail.com
     * @bodyParam password string required Admin's password . Example: 4&svd&f
     * @bodyParam section string required Admin's section . Example: software
     * 
     */
    public function adminRegister(RegisterAdminRequest $request)
    {

        // Check input validation 
        $validation = $request->validated();
        $validation['password'] = Hash::make($validation['password']);
        $validation['max_doctor_groups'] = 0;

        // Create new admin
        $newAdmin = Admin::create($validation);

        // Build success response and create admin token 
        $success['success'] = true;
        $success['token'] = $newAdmin->createToken("ADMIN")->plainTextToken;
        $success['admin'] = new AdminResource($newAdmin);


        // Return success response
        return response()->json($success, 200);
    }


    /**
     * Admin login
     * 
     * 
     * @bodyParam email string required Admin's email . Example: alimo@gmail.com
     * @bodyParam password string required Admin's password . Example: 4&svd&f
     * @bodyParam section string required Admin's section . Example: software
     */
    public function adminLogin(LoginAdminRequest $request)
    {
        // Get credentials from validated request
        $credentials = [
            'email' => $request->email,
            'password' => $request->password,
            'section' => $request->section,
        ];


        // Check Admin existing with this credentials 
        if (auth()->guard('admin')->attempt($credentials)) {

            //TODO Check if the return object is instance of Admin model
            // Return current Admin
            $admin = Admin::find(auth()->guard('admin')->user()->admin_id);

            // Delete current admin tokens 
            $admin->tokens()->delete();

            // Build success response
            $success['success'] = true;
            $success['token'] = $admin->createToken("ADMIN")->plainTextToken;
            $success['admin'] = new AdminResource($admin);

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
