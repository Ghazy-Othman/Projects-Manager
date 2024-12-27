<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class AddDoctorNotification extends Notification
{
    use Queueable;
    
    protected $password ;
    protected $admin_name ; 

    /**
     * Create a new notification instance.
     */
    public function __construct(String $password , String $admin_name)
    {
        //
        $this->password = $password ;
        $this->admin_name = $admin_name ;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @return array<int, string>
     */
    public function via(object $notifiable): array
    {
        return ['mail'];
    }

    /**
     * Get the mail representation of the notification.
     */
    public function toMail(object $notifiable): MailMessage
    {   
        return (new MailMessage)
                    ->from("ghazi.h.othamn@gmail.com", "Projects Manager App")
                    ->subject("Doctor Register")
                    ->greeting("Hello ".$notifiable->first_name)
                    ->line("You have been added as a doctor in projects manager app by admin ".$this->admin_name. " .")
                    ->line("Your Informations :")
                    ->line("First name : " . $notifiable->first_name)
                    ->line("Last name : " . $notifiable->last_name)
                    ->line("section : " . $notifiable->section)
                    ->line("email : " . $notifiable->email)
                    ->line("password : " . $this->password)
                    ->line("Please use this informations when you login into our app .");
                    
    }

    /**
     * Get the array representation of the notification.
     *
     * @return array<string, mixed>
     */
    public function toArray(object $notifiable): array
    {
        return [
            //
        ];
    }
}
