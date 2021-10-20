#include <iostream>
#include "Tree.h"

using namespace std;

int sumT(Tree t) {
    if(isEmptyT(t)) {
        return 0;
    } else {
        return root(t) + sumT(left(t)) + sumT(right(t));
    }
}

int main()
{
    Tree t = branch(1, leaf(2), leaf(3));
    cout << "root: " << root(t) << endl;
    cout << "left: " << root(left(t)) << endl;
    cout << "left: " << root(right(t)) << endl;
    cout << "sum: " << sumT(t) << endl;
    destroyT(t);
    return 0;
}
