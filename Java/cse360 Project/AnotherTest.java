import java.util.LinkedList;
import java.util.Scanner;
import java.util.*;


/*
 * an example of an array of linked lists of objects
 */
public class AnotherTest
{
	public static void main(String args[])
	{

		//creating an array of linked lists of objects
		LinkedList<Node>[] arrayOfLinkedList = new LinkedList[11];
		LinkedList<String>[] testPaths = new LinkedList[11];
		DirectedGraph graph = new DirectedGraph(arrayOfLinkedList.length);




		//initializing the linked list inside of the array
		for(int i = 0; i < 11; i++)
		{
			arrayOfLinkedList[i] = new LinkedList<Node>();
			testPaths[i] = new LinkedList<String>();
		}


		//tests for precessors


		//creating the Node objects to put inside of the array of linked lists itself

		//test for creating a node with precessors
		Node node1 = new Node(6, "Breakfast"); //2

		Node node2 = new Node(7, "Lunch"); //6

		Node node3 = new Node(8, "Dinner"); //9

		Node node4 = new Node(10, "Snack"); //7

		Node node5 = new Node(2, "Waking up"); //1

		Node node6 = new Node(1, "Walk"); //3

		Node node7 = new Node(3, "First Class"); //4

		Node node8 = new Node(2, "Walk To Lunch"); //5

		Node node9 = new Node(6, "Lab"); //8

		Node node10 = new Node(8, "Sleep"); //10

		Node node12 = new Node(2, "Mid Day"); //12




		//testing out adding precessors
		node1.addPrecessor(node5.getName());
		node2.addPrecessor(node1.getName());
		node2.addPrecessor(node8.getName());
		node3.addPrecessor(node2.getName());
		node4.addPrecessor(node2.getName());
		//node5.addPrecessor(node10.getName());
		node6.addPrecessor(node8.getName());
		node6.addPrecessor(node1.getName());
		node7.addPrecessor(node6.getName());
		node9.addPrecessor(node7.getName());
		node10.addPrecessor(node9.getName());
		node10.addPrecessor(node12.getName());
		node12.addPrecessor(node1.getName());


		//adding objects within the array of linked lists
		//these objects are inside of the array and the first element within their linked list
		arrayOfLinkedList[1].add(node1);
		arrayOfLinkedList[5].add(node2);
		arrayOfLinkedList[8].add(node3);
		arrayOfLinkedList[6].add(node4);
		arrayOfLinkedList[0].add(node5);
		arrayOfLinkedList[2].add(node6);
		arrayOfLinkedList[3].add(node7);
		arrayOfLinkedList[4].add(node8);
		arrayOfLinkedList[7].add(node9);
		arrayOfLinkedList[9].add(node10);
		arrayOfLinkedList[10].add(node12);

		//test casing the graph class
		for(int i = 0; i < arrayOfLinkedList.length; i++)
		{
			if(arrayOfLinkedList[i].get(0) == null)
			{
				i = 10;
			}
			else
			{
				graph.addVertices(i, arrayOfLinkedList[i].get(0));
			}


		}

		//test case to add an edge
		try
		{
			for(int i = 0; i < arrayOfLinkedList.length; i++)
			{
				graph.addEdge(arrayOfLinkedList[i].get(0), arrayOfLinkedList[i].get(0).getNodePrecessor());
			}
		}
		catch (IndexOutOfBoundsException e)
		{
			System.out.println("out of bounds");
		}


		//This will show an edge that was added to the graph
		System.out.println("The output graph(adjacency list)");
		graph.printGraph();
		System.out.println("---------------------------------");



		graph.test();

		System.out.println(graph.hasStartNodes());


		System.out.println("The output that shows all the paths of the graph");
		graph.printPaths();
		System.out.println("------------------------------------------------");


		graph.printFullPathList();

		graph.findingCriticalPath();


		graph.sortingPaths();



		graph.printSorted();

		graph.printCriticalPath();

		System.out.println(graph.basicCycles());
		boolean adj = graph.basicCycles();
		System.out.println(graph.hasStartNodes());
		boolean start = graph.hasStartNodes();
		System.out.println(graph.hasCycle(start, adj));
		System.out.println(graph.nodeIsNotConnected());

		System.out.println("--------------------------------------");
		graph.printLists();
		System.out.println("--------------------------------------");

		System.out.println("Testing out changing durations");
		graph.changeDuration(100, node12);
		graph.printGraph();

		graph.resetList();

		graph.printFullPathList();
		graph.sortingPaths();
		System.out.println("sorted list");
		graph.printSorted();
		graph.findingCriticalPath();


		System.out.println("critical path list");
		graph.printCriticalPath();
		System.out.println("-----------------------------");


		/*graph.printFullPathList();
		//graph.resetList();
		graph.printGraph();
		graph.test();

		graph.printPaths();

		graph.printFullPathList();
		graph.findingCriticalPath();
		graph.sortingPaths();
		System.out.println("sorted list");
		graph.printSorted();

		System.out.println("critical path list");
		graph.printCriticalPath();
		System.out.println("---------------");

		//System.out.println(graph.printSplit());
		//graph.searchForMultipleStartNodes();*/

	}
}
