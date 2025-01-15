// Inbuilt 
export 'package:flutter/material.dart';
export 'package:flutter/services.dart';
export 'dart:math';



// plugins
export 'package:google_fonts/google_fonts.dart';
export 'package:flutter_speed_dial/flutter_speed_dial.dart';



// core
export './core/app_color.dart';
export './core/app_data.dart';
export './core/app_style.dart';
export './core/app_asset.dart';
// src
    // data
        // model
        export 'src/data/model/building.dart';
        export 'src/data/model/rooms.dart';
        export 'src/data/model/common.dart';

        // repo
    // presentation
        // screen
            // splash scree
            export './src/presentation/screen/splash/splash_screen.dart';
            // on boarding screen
           export './src/presentation/screen/on_boarding_screen/on_boarding.dart';
           // auth
           export './src/presentation/screen/auth/login.dart';
           export './src/presentation/screen/auth/new_here.dart';
           export './src/presentation/screen/auth/forget_password.dart';
           export './src/presentation/screen/auth/otp.dart';
           export './src/presentation/screen/auth/otp_verified.dart';
           export './src/presentation/screen/auth/reset_password.dart';
           // dashboard
           export './src/presentation/screen/dashboard/dashboard.dart';
           // home
           export './src/presentation/screen/home/home.dart';
           // profile
           export './src/presentation/screen/profile/profile.dart';
           // schedule
           export './src/presentation/screen/schedule/schedule.dart';
           // reschedule 
           export './src/presentation/screen/reschedule/reschedule.dart';
           // cancel schedule 
           export './src/presentation/screen/cancel_schedule/cancel_schedule.dart';
           // add class
           export './src/presentation/screen/add_class/add_class.dart';
        // widget
        export './src/presentation/widget/text_field.dart';
        export './src/presentation/widget/button.dart';
        export './src/presentation/widget/app_bar_back_button.dart';
        export './src/presentation/widget/schedule_card.dart';
        export 'src/presentation/widget/read_only_text_field.dart';
        export './src/presentation/widget/common.dart';
        export './src/presentation/widget/date_row.dart';
        export './src/presentation/widget/date_card.dart';
        export './src/presentation/widget/building_row.dart';
        export './src/presentation/widget/building_card.dart';
        export './src/presentation/widget/room_row.dart';
        export './src/presentation/widget/time_row.dart';
        export './src/presentation/widget/time_card.dart';


        // animation
    

    // bussiness logic
        // provider