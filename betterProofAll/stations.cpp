#include <iostream>
#include <vector>
using namespace std;

int n, M;
vector<int> N;

// Function to check if it's possible to divide the array into segments with the max length L
bool judge(int L) {
    int start = 0, end = 0, mid = 0;
    int cnt = 0;
    int i = 0;
    for (i = 0; start < n; i++) {
        while (i < n && N[i] - N[start] <= L) {
            i++;
        }
        mid = i-1;
        cnt++;
        if (cnt > M) return false;
        while (i < n && N[i] - N[mid] <= L) {
            i++;
        }
        if(i == n) return true;
        end = i-1;
        start = end+1;
    }
    return true;
}

int main() {
    // Input for n and M
    cin >> n >> M;
    N.resize(n);

    // Reading array N
    for (int i = 0; i < n; i++) {
        cin >> N[i];
    }

    // Binary search to find the minimal length that satisfies the condition
    int lo = -1, hi = 1e9;
    int mid;

    while (lo + 1 < hi) {
        mid = (hi + lo) / 2;
        if (judge(mid)){
            hi = mid;
        }
        else {
            lo = mid;
        }
    }

    cout << hi << endl; // Output the minimal length found
    return 0;
}
