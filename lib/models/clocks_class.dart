class ClockClass {
  int hours;
  int minutes;
  bool enabled;

  ClockClass(this.hours, this.minutes, this.enabled);

//TODO: Zrób usuwanie z listy, być może trzeba zmienić sposób wyświetlania listy
//   void deleteClock(ClockClass clock){
//     clock.
//   }
}

void changeClock(ClockClass clock, int newHours, int newMinutes) {
  clock.hours = newHours;
  clock.minutes = newMinutes;
}