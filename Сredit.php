<?php

function creditPayments($loanAmount, $percentage, $commission, $otherPayments, $monthlyPayments) {

    $monthCount = 0;
    $bankPayments = 0;

    $percentage /= 100;
    $loanAmount += $otherPayments;

    for ($i = 0; $loanAmount > 0; $i++) {
      if ($i == 0) {
        $loanAmount -= $monthlyPayments;
        $monthCount++;
        continue;
      }

      $bankPayments += $loanAmount * $percentage + $commission - $loanAmount;
      $loanAmount += $loanAmount * $percentage + $commission - $monthlyPayments;
      $monthCount++;
  }

    $bankPayments *= -1;

    echo "Bank Payments: $bankPayments UAH<br>";
    echo "Time for loan repayment: $monthCount month/s";
}

echo "<h3>Homo Credit </h3>";
creditPayments(34999, 4, 500, 0, 5000);

echo "<h3>Softbank</h3>";
creditPayments(34999, 3, 1000, 0,5000);

echo "<h3>StrawberryBank</h3>";
creditPayments(34999, 2, 0, 6666, 5000);
?>