<?php

namespace App\Http\Resources;

use App\Models\Doctor;
use App\Models\Project;
use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class GroupResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'group_id' => $this->group_id , 
            'doctor_id' => $this->doctor_id ,
            'admin_student_id' => $this->student_id , 
            'students' => $this->students ,
            'project' => Project::find($this->project_id) 
        ];
    }
}
