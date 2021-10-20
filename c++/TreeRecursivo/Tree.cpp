#include "Tree.h"

Tree emptyT() {
    return NULL;
}

bool isEmptyT(Tree t) {
    return t == NULL;
}

Tree leaf(int x) {
    TNode* node = new TNode;
    node->elem  = x;
    node->left  = NULL;
    node->right = NULL;
    return node;
}

Tree branch(int x, Tree t1, Tree t2) {
    TNode* node = leaf(x);
    node->left  = t1;
    node->right = t2;
    return node;
}

int root(Tree t) {
    return t->elem;
}

Tree left(Tree t) {
    return t->left;
}

Tree right(Tree t) {
    return t->right;
}

void destroyT(Tree& t) {
    if(t != NULL) {
        destroyT(t->left);
        destroyT(t->right);
        delete t;
        t = NULL;
    }
}

int sumarT(Tree t) {
    if(isEmptyT(t)) {
        return 0;
    } else {
        return root(t) + sumarT(left(t)) + sumarT(right(t));
    }
}

int sizeT(Tree t){
    if(isEmptyT(t)){
        return 0;
    }else {
        return 1 + sizeT(t->left) + sizeT(t->right);
}}
//arbol nuevo
Tree mapDobleT(Tree t){
    if(isEmptyT(t)){
       return NULL;
    }else{
        return branch(t->elem * 2,mapDobleT(t->left),mapDobleT(t->right));
}}

bool perteneceT(Tree t, int e){
    if(isEmptyT(t)){
        return false;
    }else{
        return t->elem == e || perteneceT(t->right,e) || perteneceT(t->left,e);
    }
}

int aparicionesT(Tree t, int e){
    if(isEmptyT(t)){
        return 0;
    }else if(t->elem == e){
        return 1 + aparicionesT(t->right,e) + aparicionesT(t->left,e);
    }else{
        return aparicionesT(t->left,e) + aparicionesT(t->left,e);
    }
}

int countLeaves(Tree t){
    if(isEmptyT(t)){
        return 0;
    }
    else if(t->left == NULL && t->right == NULL){
            return 1;
        }else{
            return countLeaves(t->left) + countLeaves(t->right);
        }
}
