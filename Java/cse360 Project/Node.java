import java.io.*;
import java.util.*;

enum Visited 
{
	//black: visited and done
	//gray: can be visited again 
	//white: has not been visited
	black, gray, white;
}
public class Node
{
	private LinkedList<String> precessor;
	private LinkedList<Node> sucessor; 
	private int duration;
	private String name;
	private boolean visit;
	public Visited color;
	

	Node(LinkedList<String> precessor, int duration, String name)
	{
		this.precessor = new LinkedList<String>();
		this.duration = duration;
		this.name = name;
	}

	Node(int duration, String name)
	{
		this.color = Visited.white;
		this.precessor = new LinkedList<String>();
		this.sucessor = new LinkedList<Node>();
		this.duration = duration;
		this.name = name;
		this.visit = false; 
	}

	//Here you can change a Nodes duration 
	public static void setDuration(Node thisNode, int duration)
	{
		thisNode.duration = duration;
	}
	
	

	public static int getDuration(Node thisNode)
	{
		return thisNode.duration;
	}

	public int getDuration()
	{
		return duration;
	}

	public static void setName(Node thisNode, String name)
	{
		thisNode.name = name;
	}

	public static String getName(Node thisNode)
	{
		return thisNode.name;
	}

	public String getName()
	{
		return name;
	}

	public void addPrecessor(Node thisNode, String nextNode)
	{
		thisNode.precessor.add(nextNode);
	}

	public void addPrecessor(String nextNode)
	{
		precessor.add(nextNode);
	}

	public void addPrecessor(LinkedList<String> precessors)
	{
		for(int i = 0; i < precessors.size(); i++)
		{
			precessor.add(precessors.get(i));
		}
	}

	public void addPrecessorwithNodes(LinkedList<Node> nodes)
	{
		for(int i = 0; i < nodes.size(); i++)
		{
			precessor.add(nodes.get(i).getName());
		}
	}

	public void printNodePrecessor()
	{
		for(int i = 0; i < precessor.size(); i++)
		{
			System.out.println(precessor.get(i));
		}
	}

	public void printNodePrecessor(Node thisNode)
	{
		for(int i = 0; i < thisNode.precessor.size(); i++)
		{
			System.out.println(thisNode.precessor.get(i));
		}
	}

	public LinkedList<String> getNodePrecessor()
	{
		return precessor;
	}
	
	public void addSucessor(Node thisNode)
	{
		sucessor.add(thisNode);
	}
	
	public LinkedList<Node> getSucessor()
	{
		return sucessor;
	}
	
	public Visited getColor()
	{
		return color;
	}
	
	public void changeVisitStatus()
	{
		visit = true;
	}
	
	public void changeBackToFalse()
	{
		visit = false;
	}
	public boolean getVisitStatus()
	{
		return visit;
	}
	/*public void addPrecessor(Node thisNode, Node[] nextNodes)
	{
		nextNodes = new Node[5];
		System.out.println(nextNodes[0].getName());
		for(int i = 0; i < nextNodes.length; i++)
		{
			thisNode.precessor[i] = nextNodes[i];
			System.out.println(thisNode.precessor[i].getName());

		}
	}

	public Node[] getPrecessor(Node[] nextNodes)
	{
		return nextNodes;
	}

	public void getPrecessorInfo(Node thisNode)
	{
		System.out.println("The Precessor for" + thisNode.getName() + " " + "is" + " " + thisNode.precessor[0].getName() + " " + "with duration of" + " " + thisNode.precessor[0].getDuration());

		/*for(int i = 0; i < precessor.length; i++)
		{
			//System.out.println("The Precessor for" + thisNode.getName() + " " + "is" + " " + nextNode[i].getName() + " " + "with duration of" + " " + nextNode[i].getDuration());
			System.out.println("The Precessor for" + thisNode.getName() + " " + "is" + " " + precessor[i].getName() + " " + "with duration of" + " " + precessor[i].getDuration());
		}*/
	//}
}