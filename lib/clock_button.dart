import 'package:flutter/material.dart';

class ClockButton{
   final id;
   DateTimeRange time1;
   DateTimeRange time2;
   bool enabled;
   Color bg;

  ClockButton({this.id, this.time1, this.time2, this.enabled = false, this.bg});

}