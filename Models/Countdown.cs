using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace LIFESURGE3P.Models
{
    public class Countdown
    {
        private int days;
        private int hours;
        private int minutes;
        private int seconds;
        private TimeSpan duration;

        public Countdown (DateTime dateTime)
        {
            var est = TimeZoneInfo.FindSystemTimeZoneById("Eastern Standard Time");

            var currentDate = DateTime.Now;
            currentDate = TimeZoneInfo.ConvertTime(currentDate, est);

            var cutoffDate = dateTime;
            var countdownDate = cutoffDate - currentDate;

            duration = countdownDate;
            days = countdownDate.Days;
            hours = countdownDate.Hours;
            minutes = countdownDate.Minutes;
            seconds = countdownDate.Seconds;
        }

        public int Days { get { return days; } }
        public int Hours { get { return hours; } }
        public int Minutes { get { return minutes; } }
        public int Seconds { get { return seconds; } }
        public TimeSpan Duration { get { return duration; } }

        public bool IsExpired ()
        {
            return days <= 0 && hours <= 0 && minutes <= 0 && seconds <= 0;
        }

        public bool HasDays ()
        {
            return days > 0;
        }

        public bool HasHours ()
        {
            return hours > 0 || days > 0;
        }

        public bool HasMinutes ()
        {
            return minutes > 0 || hours > 0 || days > 0;
        }

        public bool HasSeconds ()
        {
            return seconds > 0 || minutes > 0 || hours > 0 || days > 0;
        }
    }
}