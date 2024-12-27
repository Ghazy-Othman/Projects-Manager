<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'student_id' => $this->student_id ,
            'ssn' => $this->ssn , 
            'university_id' => $this->university_id ,
            'first_name' => $this->first_name , 
            'mid_name' => $this->mid_name , 
            'last_name' => $this->last_name , 
            'section' => $this->section , 
            'year_of_study' => $this->year_of_study , 
            'email' => $this->email , 
            'group_id' => $this->group_id
        ];
    }
}
