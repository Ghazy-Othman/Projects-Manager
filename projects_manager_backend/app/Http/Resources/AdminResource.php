<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AdminResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'admin_id' => $this->admin_id ,
            'first_name' => $this->first_name , 
            'last_name' => $this->last_name , 
            'email' => $this->email , 
            'section' => $this->section , 
            'mix' => $this->mix , 
            'min_number' => $this->min_number , 
            'max_number' => $this->max_number , 
            'max_doctor_groups' => $this->max_doctor_groups , 
            'start_date' => $this->start_date ,
            'end_date' => $this->end_date ,
        ];
    }
}
