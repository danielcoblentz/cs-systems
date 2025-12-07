#include <algorithm>
#include <iostream>
#include <numeric>
#include <vector>

int main() {
    std::vector<int> numbers{1, 2, 3, 4, 5};

    int sum = std::accumulate(numbers.begin(), numbers.end(), 0);
    double average = static_cast<double>(sum) / numbers.size();

    int max_value = *std::max_element(numbers.begin(), numbers.end());

    std::cout << "Numbers: ";
    for (int n : numbers) {
        std::cout << n << ' ';
    }
    std::cout << "\nSum: " << sum << "\nAverage: " << average << "\nMax: " << max_value << '\n';
    return 0;
}
