import 'package:flutter/material.dart';

class NQueens {
  int solutionCount = 0;

  // checks for conflict on the rows and the columns
  hasNoConflict(List q, int n) {
    for (int i = 0; i < n; i++) {
      // check for column conflict
      if (q[i] == q[n]) {
        return false;
      }
      // check for major diagonal conflict
      if ((q[i] - q[n]) == (n - i)) {
        return false;
      }
      // chack for minor diagonal conflict
      if ((q[n] - q[i]) == (n - i)) {
        return false;
      }
    }
    return true;
  }

  countSolutions() {
    print(solutionCount);

    return solutionCount;
  }

  // permutate the solutions by passing the board
  enumerate(int N) {
    var a = new List(N);
    findSolution(a, 0);
  }

  //
  findSolution(List q, int n) {
    // if all rows are exhausted
    if (n == q.length) {
      // increase the solution count
      solutionCount++;
      countSolutions();
      // halt the recursive call
      return;
    }
    // iterate over a possible solution
    for (int i = 0; i < q.length; i++) {
      // place a piece
      // recurse into remaining problem
      q[n] = i;
      if (hasNoConflict(q, n)) {
        findSolution(q, n + 1);
      }
    }
  }
}
