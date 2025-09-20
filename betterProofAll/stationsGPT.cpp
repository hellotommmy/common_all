#include <iostream>
#include <vector>
using namespace std;

int n, M;
vector<int> N;

// Function to check if it's possible to divide the array into segments with the max length L
bool judge(int L) {
    int cnt = 0, last = 0;
    for (int i = 1; i < n; i++) {
        if (N[i] - N[last] > L) {
            cnt++;
            last = i - 1;
            if (cnt > M) return false;
        }
    }
    return true;
}

int main() {
    cin >> n >> M;
    N.resize(n);

    for (int i = 0; i < n; i++) {
        cin >> N[i];
    }

    int lo = 0, hi = 1e9;
    while (lo + 1 < hi) {
        int mid = (hi + lo) / 2;
        if (judge(mid))
            hi = mid;
        else
            lo = mid;
    }

    cout << hi << endl;
    return 0;
}
