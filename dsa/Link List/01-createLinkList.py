class Node:
    def __init__(self, data):   #_init_ is the initializer
        self.data= data         # set the data for the node
        self.next = None #set the next pointer to None
#create a new node
node1 = Node(10)  #__init__ is called automatically with data=10 
