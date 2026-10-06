void setup(){
  dayNum();
}

// returns [1..7] for [Monday..Sunday]
// this probably breaks if it's not 2024
// but calendar math is complicated so that's fine
// see https://en.wikipedia.org/wiki/Determination_of_the_day_of_the_week
int dayNum(){
  boolean verbose = true;
  
  // defined so we can change for testing
  int year = year();
  int month = month();
  int day = day();
  
  // start from 0 and count the
  // days that have happened so far
  int daysElapsed = 0;
  
  // cases "fall through" without break,
  // so all of the cases below a case will run
  switch(month){
    case 12:
      daysElapsed += 30; // november
    case 11:
      daysElapsed += 31; // october
    case 10:
      daysElapsed += 30; // september
    case 9:
      daysElapsed += 31; // august
    case 8:
      daysElapsed += 31; // july
    case 7:
      daysElapsed += 30; // june
    case 6:
      daysElapsed += 31; // may
    case 5:
      daysElapsed += 30; // april
    case 4:
      daysElapsed += 31; // march
    case 3:
      daysElapsed += 28; // february
      if(year % 4 == 0){
        daysElapsed += 1;
      }
    case 2:
      daysElapsed += 31; // january
    case 1:
      // no need to add previous months,
      // but account for current day
      daysElapsed += day;
  }
  
  int dayNum = daysElapsed % 7;
  if(dayNum == 0){
    dayNum = 7;
  }
  
  if(verbose){
    // see https://en.wikipedia.org/wiki/ISO_8601#Ordinal_dates
    println(year + "-" + month + "-" + day); // iso8601 date
    println("ordinal date: " + year + "-" + daysElapsed);
    println("day number: " + dayNum);
    println("it is " + weekDay(dayNum) + " my dudes");
  }
  
  return dayNum;
}

String weekDay(int dayNum){
  if(dayNum < 1 || dayNum > 7) return "ERROR";
  String[] dayNames = "Monday Tuesday Wednesday Thursday Friday Saturday Sunday".split(" ");
  return dayNames[dayNum - 1];
}
