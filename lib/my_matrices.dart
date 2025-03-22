class MyMatrices {
  static double calculateDeterminant(List<List<double>> matrix) {
    int n = matrix.length;
    if (n == 1) return matrix[0][0];

    if (n == 2) {
      return matrix[0][0] * matrix[1][1] - matrix[0][1] * matrix[1][0];
    }

    double det = 0;

    for (int i = 0; i < n; i++) {
      List<List<double>> submatrix = createSubmatrix(matrix, 0, i);

      det += (i % 2 == 0 ? 1 : -1) * matrix[0][i] * calculateDeterminant(submatrix);
    }

    return det;
  }

  static List<List<double>> createSubmatrix(List<List<double>> matrix, int rowToRemove, int colToRemove) {
    int n = matrix.length;
    List<List<double>> submatrix = [];

    for (int i = 0; i < n; i++) {
      if (i == rowToRemove) continue;

      List<double> row = [];
      for (int j = 0; j < n; j++) {
        if (j == colToRemove) continue;
        row.add(matrix[i][j]);
      }
      submatrix.add(row);
    }

    return submatrix;
  }
}
