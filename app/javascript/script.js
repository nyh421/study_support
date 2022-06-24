window.buttonClick = function () {
  let rankButton = document.getElementsByName("btn");
  let totalRank = document.getElementById("total_rank");
  let dayRank = document.getElementById("day_rank");
  let monthRank = document.getElementById("month_rank");
  let myTotalRank = document.getElementById("my_total_rank");
  let myDayRank = document.getElementById("my_day_rank");
  let myMonthRank = document.getElementById("my_month_rank");
  if (rankButton[0].checked) {
    totalRank.style.display = "";
    dayRank.style.display = "none";
    monthRank.style.display = "none";
    myTotalRank.style.display = "";
    myDayRank.style.display = "none";
    myMonthRank.style.display = "none";
  } else if (rankButton[1].checked) {
    totalRank.style.display = "none";
    dayRank.style.display = "";
    monthRank.style.display = "none";
    myTotalRank.style.display = "none";
    myDayRank.style.display = "";
    myMonthRank.style.display = "none";
  } else {
    totalRank.style.display = "none";
    dayRank.style.display = "none";
    monthRank.style.display = "";
    myTotalRank.style.display = "none";
    myDayRank.style.display = "none";
    myMonthRank.style.display = "";
  }
};

