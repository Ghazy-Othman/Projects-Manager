<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class DoctorResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'doctor_id' => $this->doctor_id , 
            'first_name' => $this->first_name , 
            'last_name' => $this->last_name , 
            'email' => $this->email , 
            'section' => $this->section , 
            'max_number_of_groups' => $this->max_number_of_groups , 
            'status' => $this->status ,
            'groups' => new GroupCollection($this->groups)
        ];
    }
}
