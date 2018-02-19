#include <iostream>
#include <string>
#include <vector>
#include <queue>

using namespace std;

template<typename T>
class Node{
private:
    vector<T> elements;
    vector< Node<T> * > nodes;
    Node<T> * parent;
public:
    // constructors
    Node(){}
    Node(Node<T> * p){ parent = p; }
    Node(T element){ elements.push_back(element); }

    // Get & Set
    void addElement(T element){
        if(!elements.empty()){
            typename vector<T>::iterator it = elements.begin();

            for(int i = 0; i < elements.size(); i++){
                if(element < elements[i]){
                    elements.insert(it+i, element);
                    return;
                }
            }
            elements.push_back(element);            
            
        }else{
            elements.push_back(element);            
        }
    }

    T getElement(int position){
        return elements[position];
    }

    T removeElementAt(int position){
        typename vector<T>::iterator it = elements.begin();        
        T temp = elements[position];
        elements.erase(it+position);
        return temp;
    }

    void removeElement(T element){
        if(!elements.empty()){
            typename vector<T>::iterator it = elements.begin();
            for(int i = 0; i < elements.size(); i++){
                if(element == elements[i]){
                    elements.erase(it+i);
                    return;
                }
            }
            cout << "Element didnt exist" << endl;
        }else{
            cout << "Vector elements empty cant remove" << endl;           
        }
    }

    int getElementsSize(){return elements.size();}

    void print(){
        for(int i = 0; i < elements.size(); i++){
            cout << elements[i] << ", ";
        }        
        cout << endl;
    }

    bool hasNodes(){return !nodes.empty();}

    void addNode(Node<T> * node){
        
        if(!nodes.empty()){
            typename vector< Node<T> * >::iterator it = nodes.begin();

            for(int i = 0; i < nodes.size(); i++){
                if(node->getElement(0) < nodes[i]->getElement(0)){
                    nodes.insert(it+i, node);
                    break;
                }
            }
        }else{
            nodes.push_back(node);
        }
    }

    void addNodeToBack(Node<T> * node){
        nodes.push_back(node);
    }

    Node<T> * getNode(int position){
        return nodes[position];
    }

    vector < Node<T> * > getNodes(){
        return nodes;
    }

    void removeNode(Node<T> * node){
        if(!nodes.empty()){
            typename vector< Node<T> * >::iterator it = nodes.begin();

            for(int i = 0; i < nodes.size(); i++){
                if(node == nodes[i]){
                    nodes.erase(it+i);
                    break;
                }
            }
        }else{
            cout << "Vector nodes empty cant remove" << endl;           
        }
    }

    int toNode(T element){
        typename vector<T>::iterator it = elements.begin();
        int i;
        for(int i = 0; i < elements.size(); i++){
            if(element < elements[i]){
                return i;
            }
        }
        return -1;
    }

    void setParent(Node<T> * p){parent = p;}
    Node<T> * getParent(){return parent;}
};

template<typename T>
class BPlusTree{
private:
    Node<T> *head;
    int maxDegree;

    // helper function for inserting element until finding lowest level
    void addElementAux(T element, Node<T> *head){
        if(head == NULL){
            head = new Node<T>(element);
        }else{

            if(!head->hasNodes()){
                // if head has not any children nodes, it means we have to insert the element in this level
                // validate if we can insert in this node or if we have to split
                if(head->getElementsSize() < maxDegree - 1){
                    head->addElement(element);
                }else{
                    head->addElement(element);                    
                    splitAux(head);
                }
            }else{
                // if has children nodes, only see in which node to continue
                int nodeIndex = head->toNode(element);
                if(nodeIndex > -1){
                    addElementAux(element, head->getNode(nodeIndex));
                }else{
                    Node<T> * newNode = new Node<T>();
                    head->addNodeToBack(newNode);
                    addElementAux(element, newNode);
                }
            }

        }
    }

    // helper function for splitting recursively
    void splitAux(Node<T> *head){
        // get the value that go to top
        int from = maxDegree / 2;

        Node<T> * parent = head->getParent();
        T upElement = head->getElement(from);
        // validate if we can insert in this node parent or if we have to split it
        if(parent == NULL){
            Node<T> *p = new Node<T>(upElement);
            Node<T> *next = new Node<T>();

            for(int i = from; i < head->getElementsSize(); i++){
                T element = head->removeElementAt(i);
                next->addElement(element);
            }

            p->addNode(head);
            p->addNode(next);

            this->head = p;

        }else if(parent->getElementsSize() < maxDegree - 1){

            Node<T> *next = new Node<T>();

            for(int i = from; i < head->getElementsSize(); i++){
                T element = head->removeElementAt(i);
                next->addElement(element);
            }

            parent->addElement(upElement);
            parent->addNode(next);
            
        }else{
            parent->addElement(upElement);         
            splitAux(parent);
        }
    }

    // helper function for printing tree
    void printAux(Node<T> * head){
        queue< Node<T> * > queue;
        queue.push(head);
        Node<T> * node;
        while(!queue.empty()){
            node = queue.front();
            node->print();
            queue.pop();
            vector < Node<T> * > nodes = node->getNodes();
            for(int i = 0; i < nodes.size(); i++){
                queue.push(nodes[i]);
            }
        }
    }
public:
    BPlusTree(Node<T> *h, int m = 3){
        head = h;
        maxDegree = m;
    }

    BPlusTree(int m = 3){
        head = new Node<T>();
        maxDegree = m;
    }

    void setHead(Node<T> *h){head = h;}
    Node<T> * getHead() {return head;}

    void setMaxDegree(int m){maxDegree = m;}
    int getMaxDegree(){return maxDegree;}

    void addElement(T element){
        addElementAux(element, head);
    }

    void print(){
        cout << endl;
        head->print();
        printAux(head);
        cout << endl;
    }

};

int main(){

    int maxDegree = 0;
    
    cout << "Set max degree: ";
    cin >> maxDegree;

    BPlusTree<int> tree(maxDegree);
    int ans = 0;
    while(ans < 2){
        cout << "------------------------" << endl;
        cout << "|                      |" << endl;
        cout << "|          Menu        |" << endl;
        cout << "|                      |" << endl;
        cout << "| 0. Add element       |" << endl;
        cout << "| 1. Print B+Tree      |" << endl;
        cout << "| 2. Exit              |" << endl;
        cout << "|                      |" << endl;
        cout << "------------------------" << endl;

        cin >> ans;

        switch(ans){
            case 0: {
                int element = 0;
                cout << "Element: ";
                cin >> element;
                tree.addElement(element);
                break;
            }
            case 1:{
                tree.print();
                break;
            }
            case 2:
                cout << "bye" << endl;
                break;
            default:{
                cout << "Opcion no válida" << endl;
                ans = 0;
                break;
            }
        }
    }
    return 0;
}