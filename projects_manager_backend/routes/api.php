<?php

use App\Http\Controllers\AddRequestsController;
use App\Http\Controllers\Api\Admin\AdminAuthController;
use App\Http\Controllers\Api\Admin\AdminController;
use App\Http\Controllers\Api\Doctor\DoctorAuthController;
use App\Http\Controllers\Api\Doctor\DoctorController;
use App\Http\Controllers\Api\Student\StudentAuthController;
use App\Http\Controllers\Api\Student\StudentController;
use App\Http\Controllers\GroupController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\ProjectRequestController;
use App\Http\Controllers\ResetPasswordController;
use App\Http\Resources\AddRequestCollection;
use App\Http\Resources\GroupCollection;
use App\Models\AddRequests;
use App\Models\Admin;
use App\Models\Group;
use App\Models\ProjectRequest;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use PhpParser\Node\Expr\Cast\String_;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/


//========================================
//              Admins
//========================================
Route::prefix('admins')->group(function () {

    Route::get('/', [AdminController::class, 'index']);

    Route::get('/{admin}', [AdminController::class, 'show']);


    // Register
    Route::post('auth/register', [AdminAuthController::class, 'adminRegister']);

    // Login
    Route::post('auth/login', [AdminAuthController::class, 'adminLogin']);

    Route::post('/password/forget-password', [ResetPasswordController::class, 'forgetPassword']);

    Route::post('/password/reset-password', [ResetPasswordController::class, 'resetPassword']);

    // Token needed to do this actions 
    Route::middleware('auth:sanctum')->group(function () {

        // Add new doctor
        Route::post('add-doctor', [AdminController::class, 'addNewDoctor']);

        // Upload students info file
        Route::post('upload-file', [AdminController::class, 'uploadFile']);

        // Add and Update form rules
        Route::post('update-form-rules', [AdminController::class, 'updateFormRules']);
    });
});




//========================================
//              Doctors
//========================================
Route::prefix('doctors')->group(function () {

    Route::get('/', [DoctorController::class, 'index']);

    Route::get('/{doctor}', [DoctorController::class, 'show']);

    Route::post('/password/forget-password', [ResetPasswordController::class, 'forgetPassword']);

    Route::post('/password/reset-password', [ResetPasswordController::class, 'resetPassword']);

    // Login
    Route::post('auth/login', [DoctorAuthController::class, 'doctorLogin']);


    // Token needed to do this actions 
    Route::middleware('auth:sanctum')->group(function () {

        // Accept or reject project request
        Route::post('update-project-request', [ProjectRequestController::class, 'updateProjectRequestState']);
    });
});




//========================================
//              Students
//========================================
Route::prefix('students')->group(function () {

    // Get student with filter
    Route::get('/', [StudentController::class, 'index']);

    Route::post('/password/forget-password', [ResetPasswordController::class, 'forgetPassword']);

    Route::post('/password/reset-password', [ResetPasswordController::class, 'resetPassword']);

    // Get specific student
    Route::get('/{student}', [StudentController::class, 'show']);

    //
    Route::post('auth/student-verification' , [StudentAuthController::class , 'studentVerification']) ;

    // Register 
    Route::post('auth/register', [StudentAuthController::class, 'studentRegister']);

    // Login 
    Route::post('auth/login', [StudentAuthController::class, 'studentLogin']);


    // Get all recieved add requests for this student    
    Route::get("/get-add-requests/{student_id}" , function(int $student_id) {

        $reAddRequests = AddRequests::where("reciver_student_id" , $student_id)->get() ;
        
        return response() -> json([
            'success' => true ,
            're_add_requests' => new AddRequestCollection($reAddRequests)
        ] , 200) ;

    }) ;

    // Token needed to do this actions 
    Route::middleware('auth:sanctum')->group(function () {

        // Create group
        Route::post('/create-group', [GroupController::class, 'createGroup']);

        // Send add request to student
        Route::post('/add-request', [AddRequestsController::class, 'sendAddRequest']);

        // Accept or reject add request
        Route::post('/update-add-request', [AddRequestsController::class, 'updateAddRequest']);


        // Send project request
        Route::post('/project-request', [ProjectRequestController::class, 'sendProjectRequest']);
    });
});




//========================================
//              Groups
//========================================
Route::prefix('groups')->group(function () {

    Route::get('/', [GroupController::class, 'index']);

    Route::get('/{group}', [GroupController::class, 'show']);
});




//========================================
//              Projects
//========================================
Route::prefix('projects')->group(function () {

    Route::get('/', [ProjectController::class, 'index']);

    Route::get('/{project}', [ProjectController::class, 'show']);
});




Route::get("/form-rules/{section}" , function(string $section) {

    $admin = Admin::where('section' , $section)->first() ;
    return response()->json(
        [
            'success' => true  ,
            'min_number_of_student' => $admin->min_number , 
            'max_number_of_student' => $admin->max_number, 
            'mix' => $admin->mix 
            
        ]
        ,200
    ) ; 

}) ;

// Chcek if file uploaded 
Route::get('/check-file-uploaded/{section}' , function (String $section) {
    $students = Student::where('section' , $section)->get() ;
    return response()->json(
        [
            'success' => true , 
            'count' => count($students)
        ]
        ,200
    );
}) ;


Route::get('/doctor-groups/{doctor_id}' , function (int $doctor_id) {
    $groups = Group::where('doctor_id' , $doctor_id)->get() ;
    return response()->json(
        [
            'success' => true ,
            'groups' => new GroupCollection($groups)
        ],
        200
    );
}
);


Route::get('/doctor-projcet-requests/{doctor_id}' , function(int $doctor_id) {

    $project_requests = ProjectRequest::where('doctor_id' , $doctor_id)->where('status' , 2)->get() ;

    return response()->json([
        'success' => true , 
        'project_requests' => $project_requests
    ] , 200) ;

}) ;


Route::get('/check-students' , function(){
    $students = Student::all() ;
    return response()->json(
        [
            'success' => true ,
            'cnt' => count($students) ,
        ],200
    ) ;
});