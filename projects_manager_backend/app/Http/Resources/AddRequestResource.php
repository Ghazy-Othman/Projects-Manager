<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class AddRequestResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'add_request_id' => $this->add_request_id ,
            'group_id' => $this->group_id , 
            'sender_student' => new StudentResource($this->senderStudent) ,
            'reciver_student_id' =>$this->reciver_student_id , 
            'status' => $this->status
        ] ;
    }
}
