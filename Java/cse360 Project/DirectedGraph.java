import java.io.*;
import java.util.*;

/*
 *PLEASE IGNORE THE YELLOW WARNINGS
 *if you try changing the data structure to remove the yellow warnings
 *you might mess up the whole data structure. If you are going to make
 *changes to the data structure, please make sure it works with the correct
 *output before uploading the changes to bitBucket.
 */
/*
 * TO DO:
 * 
 * Reset certain lists after a change of duration
 * textfile I/O
 * front end changes 
 *
 * 
 * 
 */
public class DirectedGraph
{
	Node node;
	private LinkedList<Node> adj[];

	//going to use this to store the paths with the summations
	private LinkedList<String> pathSum[];
	private LinkedList<String> gettingPaths;
	private LinkedList<String> pathsList[];
	private LinkedList<Node> paths[];
	private LinkedList<Node> startNodes;
	private LinkedList<Node> path;
	private LinkedList<Node> endNodes;
	private LinkedList<Node> finalPathList[];
	private LinkedList<Node> addingToList[];
	private LinkedList<String> criticalPath[];
	LinkedList<Node> printStartNodes;
	LinkedList<Node> printEndNodes;
	boolean isCycle = false;
	int sum = 0;
	int index = 0;
	int counter = 0;
	int place = 0;

	DirectedGraph(int size)
	{
		adj = new LinkedList[size];
		pathSum = new LinkedList[size];
		gettingPaths = new LinkedList<String>();
		paths = new LinkedList[size];
		startNodes = new LinkedList<Node>();
		path = new LinkedList<Node>();
		endNodes = new LinkedList<Node>();
		finalPathList = new LinkedList[size];
		addingToList = new LinkedList[size];
		pathsList = new LinkedList[size];
		criticalPath = new LinkedList[size];
		printStartNodes = new LinkedList<Node>();
		printEndNodes = new LinkedList<Node>();

		for(int i = 0; i < adj.length; i++)
		{
			adj[i] = new LinkedList<Node>();
		}

		for(int i = 0; i < pathSum.length; i++)
		{
			pathSum[i] = new LinkedList<String>();
		}

		for(int i = 0; i < paths.length; i++)
		{
			paths[i] = new LinkedList<Node>();
		}

		for(int i = 0; i < finalPathList.length; i++)
		{
			finalPathList[i] = new LinkedList<Node>();
		}

		for(int i = 0; i < addingToList.length; i++)
		{
			addingToList[i] = new LinkedList<Node>();
		}

		for(int i = 0; i < pathsList.length; i++)
		{
			pathsList[i] = new LinkedList<String>();
		}
		
		for(int i = 0; i < criticalPath.length; i++)
		{
			criticalPath[i] = new LinkedList<String>();
		}

	}


	//add vertices to the actual list
	public void addVertices(int i, Node node)
	{
		//System.out.println(node.getName());

		adj[i].add(node);
	}

	//just in case for phase 2, you will not need this method for now
	public boolean nodeExists(Node thisNode)
	{
		for(int i = 0; i < adj.length; i++)
		{
			if(thisNode.getName().equalsIgnoreCase(adj[i].get(0).getName()))
			{
				return true;
			}
		}
		return false;
	}

	//adding edges to the graph
	public void addEdge(Node startNode, LinkedList<String> endNodes)
	{
		for(int i = 0; i < endNodes.size(); i++)
		{

				for(int g = 0; g < adj.length; g++)
				{
					if(endNodes.get(i).equalsIgnoreCase(adj[g].get(0).getName()))
					{
						for(int j = 0; j < adj.length; j++)
						{
							if(startNode.getName() == adj[j].get(0).getName())
							{

								adj[g].add(adj[j].get(0));

							}

						}
					}
				}

		}
	}

	public LinkedList<Node> findStartNodes()
	{
		for(int i = 0; i < adj.length; i++)
		{
			if(adj[i].get(0).getNodePrecessor().size() == 0)
			{
				startNodes.add(adj[i].get(0));
			}
		}

		return startNodes;
	}

	public LinkedList<Node> findEndNodes()
	{

		for(int i = 0; i < adj.length; i++)
		{
			if(adj[i].size() == 1)
			{
				endNodes.add(adj[i].get(0));
			}
		}

		return endNodes;
	}

	//need to incremete index everytime it hits an end node
	public void test()
	{

		printEndNodes = this.findEndNodes();

		for(int i = 0; i < printEndNodes.size(); i++)
		{
			//System.out.println(printEndNodes.get(i).getName());
		}

		printStartNodes = this.findStartNodes();

		for(int j = 0; j < printStartNodes.size(); j++)
		{
			for(int g = 0; g < printEndNodes.size(); g++)
			{

				this.callingPathFunc(printStartNodes.get(j), printEndNodes.get(g), index);

				//index++;
			}
		}
	}

	//Printing each element in the graph
	public void printGraph()
	{
		for(int i = 0; i < adj.length; i++)
		{
					for(int j = 0; j < adj[i].size(); j++)
					{
						System.out.println("Activity with the name of\t " + adj[i].get(j).getName() + "\twith the duration " + adj[i].get(j).getDuration() + "\t located at " + i + "\t" + j);

					}
			}
;
	}

	
	public boolean isConnected(Node thisNode)
	{
		for(int i = 0; i < adj.length; i++)
		{
			for(int j = 1; j < adj[i].size(); j++)
			{
				if(adj[i].get(j).getName().equalsIgnoreCase(thisNode.getName()))
				{
					return true;
				}
			}
		}

		return false;
	}

	public boolean hasPrecessor(Node thisNode)
	{
		LinkedList<String> precessors = new LinkedList<String>();

		for(int i = 0; i < adj.length; i++)
		{
			precessors = adj[i].get(0).getNodePrecessor();
			for(int j = 0; j < precessors.size(); j++)
			{
				if(precessors.get(j).equalsIgnoreCase(thisNode.getName()))
				{
					return true;
				}
			}
		}

		return false;
	}

	//To determine a start node or an end node
	//true if it is an end node
	//false if it is a start node
	public boolean isEndNode(Node thisNode)
	{
		//need to rewrite this
		return false;
	}

	//false if it is an end node
	public boolean hasSucessors(Node thisNode)
	{
		for(int i = 0; i < adj[i].size(); i++)
		{
			if(adj[i].get(0).getName().equalsIgnoreCase(thisNode.getName()))
			{
				if(adj[i].size() > 0)
				{
					return true;
				}
			}
		}
		return false;
	}
	
	//use this for error checking if node is connected
	//true if not connected 
	//false if it is 
	public boolean nodeIsNotConnected()
	{
		for(int i = 0; i < adj.length; i++)
		{
			for(int j = 0; j < adj[i].size(); j++)
			{
				if(this.isConnected(adj[i].get(j)) == false && this.hasPrecessor(adj[i].get(j)) == false)
				{
					return true;
				}
			}
		}
		return false;
	}


	public LinkedList<String>[] getAllPrecessors(LinkedList<Node>[] nodes)
	{
		String empty = " ";
		System.out.println("Length of nodes array is: " +  nodes.length);
		for(int i = nodes.length - 1; i > 0; i--)
		{

			for(int j = 0; j < nodes[i].get(0).getNodePrecessor().size(); j++)
			{
				System.out.println("i, j: " + i + " , " + j);
				if(nodes[i].get(0).getNodePrecessor().get(j).length() == 0)
				{
					System.out.println("empty");
				}
				else
				{
					pathSum[i].add(nodes[i].get(0).getNodePrecessor().get(j));
				}
			}
		}
		return pathSum;
	}

	public int searchForNode(Node thisNode)
	{
		for(int i = 0; i < adj.length; i++)
		{
			if(thisNode.getName().equalsIgnoreCase(adj[i].get(0).getName()))
			{
				return i;
			}
		}

		return 0;
	}

	//this changes the duration of a node object 
	public void changeDuration(int duration, Node thisNode)
	{
		int index = searchForNode(thisNode);
		
		adj[index].get(0).setDuration(thisNode, duration);
		
		System.out.println(adj[index].get(0).getDuration());
		
	}
	
	public void printPathSum()
	{
		for(int i = 0; i < pathSum.length; i++)
		{
			for(int j = 0; j < pathSum[i].size(); j++)
			{
				System.out.println(pathSum[i].get(j));
			}
		}
	}

	public void findingPaths(int index)
	{
		if(index < adj.length)
		{
			for(int i = 0; i < adj.length; i++)
			{

				if(adj[i].size() < 1)
				{
					for(int j = 1; j < adj[i].size(); j++)
					{

					}
				}

			}
		}
	}

	public void addToExistingList(Node node, Node nodeToAdd)
	{
		System.out.println("Adding " + nodeToAdd.getName() + "to" + node.getName());

		for(int i = 0; i < adj.length; i++)
		{
			if(adj[i].getFirst().getName().equalsIgnoreCase(node.getName()))
			{
				adj[i].add(nodeToAdd);
			}
		}
	}


	public void callingPathFunc(Node source, Node Destination, int index)
	{

		path.add(source);

		this.allPaths(source, Destination, index);

		path.remove(source);
		//System.out.println("index is" + index);
	}

	public LinkedList<Node> allPaths(Node currentNode, Node Destination, int index)
	{
		currentNode.changeVisitStatus();

		if(currentNode.equals(Destination))
		{
			counter++;

			try{

				for(int i = 0; i < path.size(); i++)
				{
				   addingToList[counter].add(path.get(i));
				  }

			}
			catch(Exception e)
			{

			}
		}


		for(int i = 0; i < adj.length; i++)
		{
			try{

				if(currentNode.getName() == adj[i].get(0).getName())
				{
					for(int j = 1; j < adj[i].size(); j++)
					{

						path.add(adj[i].get(j));
						try{
							allPaths(adj[i].get(j), Destination, index);
						}
						catch(Exception e)
						{
							isCycle = true;
						}

						path.remove(adj[i].get(j));

					}
				}
			}
			
			catch(StackOverflowError e)
			{
				isCycle = true;
			}

		}

		currentNode.changeBackToFalse();
		
		return null;
	}
	
	
	public int adjCheck()
	{
		int j = 0;
		for(int i = 0; i < adj.length; i++)
		{
		
			if(adj[i].size() >= 2)
			{
				j++;
			}
			
		}
		
		return j;
	}
	//return false when there is no cycle
	//returns true if there is
	public boolean basicCycles()
	{
		int checked = this.adjCheck();
		if(checked == adj.length)
		{
			return true;
		}
		return false;
	}
	
	//return false no cycle
	//return true if there are cycles
	public boolean hasStartNodes()
	{
		if(printStartNodes.size() == 0)
		{
			return true;
		}
		return false;
	}
	
	//use this to check for cycles
	//return false no cycle 
	//return true if there is are cycles
	public boolean hasCycle(boolean adj, boolean start)
	{
		
		if(adj == true || start == true || isCycle == true)
		{
			return true;
		}
		
		return false;
	}
	

	public int splitPath(LinkedList<Node> node)
	{

			int counter = 0;
			for(int q = 0; q < node.size(); q++)
			{

				for(int j = 0; j < startNodes.size(); j++)
				{

					if(node.get(q).getName() == startNodes.get(j).getName())
					{
						counter++;
					}
				}
			}
			return counter;
	}
	
	public boolean printSplit()
	{	
		
		for(int i = 0; i < addingToList.length; i++)
		{
			if(this.splitPath(addingToList[i]) >= 2)
			{
				return false;
			}
		}
		
		return true;
	}

	//prints paths
	public void printPaths()
	{
		for(int i = 0; i < addingToList.length; i++)
		{
			System.out.println(this.addingPaths(addingToList[i]));
			for(int j = 0; j < addingToList[i].size(); j++)
			{
				System.out.println(addingToList[i].get(j).getName() + " at " + i + " at index " + j);
			}
		}
	}


	//add paths
	public int addingPaths(LinkedList<Node> nodes)
	{
		int sum1 = 0;

		for(int i = 0; i < nodes.size(); i++)
		{
			sum1 += nodes.get(i).getDuration();
		}

		return sum1;
	}

	public void addToPathList()
	{
	
		for(int i = 0; i < addingToList.length; i++)
		{
			int sumation = addingPaths(addingToList[i]);
			String durations = Integer.toString(sumation);
			
			for(int j = 0; j < addingToList[i].size(); j++)
			{
				
				pathsList[i].add(addingToList[i].get(j).getName());
			}
			
			
				pathsList[i].add(durations);
		
		}

	}

	public void printFullPathList()
	{
		this.addToPathList();
		for(int i = 0; i < pathsList.length; i++)
		{
			for(int j = 0; j < pathsList[i].size(); j++)
			{
				System.out.println(pathsList[i].get(j) + " at " + i + " at index " + j);
			}
		}
	}
	
	public int findMaxDuration()
	{
		int max = 0;
		System.out.println("paths = " + pathsList.length);
		for(int i = 0; i < pathsList.length; i++)
		{
			if(Integer.parseInt(pathsList[i].getLast()) > max)
			{
				max = Integer.parseInt(pathsList[i].getLast());
			}

		}
		return max;
	}

	public LinkedList<String>[] findingCriticalPath()
	{
		int max = this.findMaxDuration();
		for(int i = 0; i < pathsList.length; i++)
		{
			for(int j = 0; j < pathsList[i].size(); j++)
			{
				if(Integer.parseInt(pathsList[i].getLast()) == max)
				{
					System.out.println(pathsList[i].get(j));
					criticalPath[i].add(pathsList[i].get(j));
				}
			}

		}

		return criticalPath;
	}
	
	public void printLists()
	{
		System.out.println("CiriticalPath List");
		for(int i = 0; i < criticalPath.length; i++)
		{
			for(int j = 0; j < criticalPath[i].size(); j++)
			{
				System.out.println("i = " + i);
				System.out.println("j = " + j);
				System.out.println(criticalPath[i].get(j));
			}
		}
		System.out.println("-------------------------------------------------------");
		
		System.out.println("Paths List");
		for(int i = 0; i < pathsList.length; i++)
		{
			for(int j = 0; j < pathsList[i].size(); j++)
			{
				System.out.println(pathsList[i].get(j));
			}
		}
		System.out.println("-------------------------------------------------------");

		System.out.println("Adding to list");
		for(int i = 0; i < addingToList.length; i++)
		{
			for(int j = 0; j < addingToList[i].size(); j++)
			{
				System.out.println(addingToList[i].get(j).getName());
			}
		}
		System.out.println("-------------------------------------------------------");

	}
	
	public void resetList()
	{
	try{
		for(int i = 0; i < criticalPath.length; i++)
		{
			
			
			for(int j = 0; j < criticalPath[i].size(); j++)
			{
				criticalPath[i].remove(j);
				j--;
			}
			
			
		}
		
	}
	catch(IndexOutOfBoundsException e)
	{
		
	}
		
	try{
		
	
		for(int i = 0; i < pathsList.length; i++)
		{
			for(int j = 0; j < pathsList[i].size(); j++)
			{
				pathsList[i].remove(j);
				j--;
			}
		}
	}
	catch(IndexOutOfBoundsException e)
	{
		
	}

	
}
	public void printCriticalPath()
	{
		System.out.println("Critical Path: ");
		for(int i = 0; i < criticalPath.length; i++)
		{
			for(int j = 0; j < criticalPath[i].size() - 1; j++)
			{
				if(!pathsList[i].get(0).equals("0"))
				{
					System.out.print(criticalPath[i].get(j));
					if(j != criticalPath[i].size() - 2)
					{
						System.out.print("->");
					}
				}
			}
			
			System.out.println();
		}
		System.out.println("-------------------------------");
		
	}
	public void sortingPaths(){
		for(int j = 1; j < pathsList.length; j++){
			LinkedList<String> key = pathsList[j];	//data of index 2
			int i = j-1;		//index 1
			
			while(i>=0 && Integer.parseInt(pathsList[i].getLast()) < Integer.parseInt(key.getLast())){
				pathsList[i+1]= pathsList[i];	//data at index 2 now equals data of index 1
				i = i-1;		//set i to index 0
			}
			pathsList[i+1] = key; //index 1 data has now been swapped
		}
	}
	
	public void printSorted() {
		System.out.println("Sorted list of paths: ");
		for(int i = 0; i < pathsList.length ; i++) {
			if(!pathsList[i].get(0).equals("0"))
			{
				for(int j = 0; j < pathsList[i].size() - 1; j++) {
					if(!pathsList[i].get(0).equals("0")) {
						System.out.print(pathsList[i].get(j));
						if(j != pathsList[i].size() - 2)
						{
							System.out.print("->");
						}
					}
				}
			
				System.out.println();
		}
		}
		System.out.println("------------------------------");
	}
	
	
	
}
