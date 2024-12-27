<?php

namespace App\Http\Requests\Api\Auth;

use Illuminate\Foundation\Http\FormRequest;

class RegisterStudentRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            //
            'student_id' => 'required' ,
            'first_name' => "required" ,
            'mid_name' => "required" ,
            'last_name' => "required" ,
            'email' => 'required|email|unique:students,email' ,
            'password' => "required|min:8" ,    

        ];
    }
}
