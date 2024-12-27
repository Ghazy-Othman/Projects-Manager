<?php

namespace App\Notifications;

use Ichtrojan\Otp\Otp;
use Illuminate\Bus\Queueable;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class ResetPasswordNotification extends Notification
{
    use Queueable;
    private $otp ; 

    /**
     * Create a new notification instance.
     */
    public function __construct()
    {
        //
        $this->otp = new Otp ; 
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
        $otpCode = $this->otp->generate($notifiable->email , 'numeric' , 5 , 3) ;
        return (new MailMessage)
                    ->from('ghazi.h.othman@gmail.com' , "Project Manager App")
                    ->subject("Reset Password")
                    ->greeting("Hello ".$notifiable->first_name)
                    ->line("Please enter this code in reset password verfication page .")
                    ->line("Code : ".$otpCode->token) ;
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
