import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import java.util.List;
import java.util.*;
import java.io.*;
import javafx.scene.Scene;
import javafx.scene.control.TextField;
import javafx.scene.layout.BorderPane;
import javafx.scene.control.Menu;
import javafx.scene.control.MenuBar;
import javafx.scene.control.MenuItem;
import javafx.scene.layout.VBox;
import javafx.scene.control.Button;
import javafx.scene.layout.StackPane;
import javafx.stage.Stage;
import javafx.scene.image.Image;
import javafx.collections.ObservableList;
import javafx.scene.control.Label;
import javafx.scene.control.TableColumn;
import javafx.scene.control.TableView;
import javafx.scene.layout.VBox;
import javafx.scene.text.Font;
import javafx.scene.layout.Region;
import javafx.scene.control.SeparatorMenuItem;
import javafx.scene.control.cell.PropertyValueFactory;
import javafx.collections.ObservableList;
import javafx.collections.ListChangeListener;
import javafx.collections.FXCollections;
import javafx.scene.control.TableView.ResizeFeatures;
import javafx.scene.layout.HBox;
import javafx.scene.control.Label;
import javafx.geometry.Pos;
import javafx.scene.control.Alert;
import javafx.scene.control.Alert.AlertType;
import javafx.event.EventHandler;
import javafx.scene.control.TextFormatter;
import javafx.util.converter.IntegerStringConverter;
import java.util.function.UnaryOperator;
import javafx.scene.control.TextFormatter.Change;
import java.awt.*;
import java.awt.event.*;

//This is stuff that you need to import in order to be able to display most things on the screen
//Not everything imported right now is being use, I just imported stuff to play around with the design

public class NetworkDiagramInterface extends Application
{
	//These are the textfields, button and table
	public String name;
	TableView<TableSetUp> table;
	public TextField textField = new TextField();
	public TextField textField2 = new TextField();
	public TextField textField3 = new TextField();
	public Button button = new Button("Add Node");
	public Button resetTable = new Button("Restart Option");
	public Button findPath = new Button("Find path");
	public Alert aboutAlert = new Alert(AlertType.INFORMATION);
	public Alert error = new Alert(AlertType.INFORMATION);
	public Alert helpAlert = new Alert(AlertType.INFORMATION);
	public ArrayList<Integer> durationArray = new ArrayList<Integer>();
	public ArrayList<String> dependencyArray = new ArrayList<String>();
	public ArrayList<String> ActivityArray = new ArrayList<String>();
	//public ArrayList<TableSetUp> mainlist = new ArrayList<TableSetUp> ();
	//public LinkedList<Node> mainlist = new LinkedList<Node>();
	int sum = 0;



	public static void main(String[] args)
	{
		launch(args);

	}
	public void start(Stage primaryStage) throws Exception
	{

		//This line is creating the borderpane container
		BorderPane pane = new BorderPane();
		Stage tutorial = new Stage();
		BorderPane mes = new BorderPane();
		Scene message = new Scene(mes, 200,200);

		//This one is creating the scene, adding the container to the scene and setting up the size of the scene
		Scene scene2 = new Scene(pane, 1000,1000);

		//This one is to set the title of the Window
		primaryStage.setTitle("Network Diagram Analyzer");
		primaryStage.getIcons().add(new Image("file:network.png"));

		//This creates the columns in the table
		TableColumn<TableSetUp,String> nameColumn = new TableColumn<>("Activity");
		TableColumn<TableSetUp,String> dependencyColumn = new TableColumn<>("Dependency");
		TableColumn<TableSetUp,Integer> durationColumn = new TableColumn<>("Duration");

		//Sets maximum width size of the cells in the table
		nameColumn.setMaxWidth(250);
		dependencyColumn.setMinWidth(250);
		durationColumn.setMinWidth(250);

		//This is saying what value the columns are going to take, uses the same name
		//as the one in the TableSetUp class
		nameColumn.setCellValueFactory(new PropertyValueFactory<>("name"));
		dependencyColumn.setCellValueFactory(new PropertyValueFactory<>("dependency"));
		durationColumn.setCellValueFactory(new PropertyValueFactory<>("duration"));

		//This creates the new table
		table = new TableView<>();

		//This is setting the items for the table
		table.setItems(getTableSetUp());
		table.getColumns().addAll(nameColumn,dependencyColumn,durationColumn);

		//This is just creating some labels for the textFields
		Label lab1 = new Label("Activity");
		Label lab2 = new Label("Dependency");
		Label lab3 = new Label("Duration");
		Label addNode = new Label("Add a new Node");
		Label clear = new Label("Clear all content in the table");
		Label path = new Label("Find the critical paths in the diagram, in descending order!");

		//About section message when click on about section Item
		aboutAlert.setTitle("About us");
		aboutAlert.setHeaderText("A Network Diagram Analyzer V1.1 Developed by LethalRacingTechnologies");
		aboutAlert.setContentText("The software and all of its content are property of LethalRacingTechnologies Enterprise.");

        //Help section
		helpAlert.setTitle("Help option");
		helpAlert.setHeaderText("What each function is supposed to do");
		helpAlert.setContentText("FindPath button starts the processing");
		helpAlert.setContentText("About option displays the program owner information");
		helpAlert.setContentText("AddNode button adds the node in the table with all the information");
		helpAlert.setContentText( "FindPath button starts the processing" + "\n" + "About option displays the program owner information" + "\n" + "AddNode button adds the node in the table with all the information" + "\n" + "Restart button clears the table");



		//aboutAlert.showAndWait();

		error.setTitle("Error!");
		error.setHeaderText("You just entered an invalid character!");
		error.setContentText("Only 0 and positive integers are allow. You will have to start over;the table will be erased");

		//This is just a container that will have the textfield and the button and labels
		VBox box = new VBox(lab1,textField,lab2,textField2,lab3,textField3,addNode,button,clear,resetTable,path,findPath);
		resetTable.setOnAction(action -> table.getItems().clear());


		// Adds a menu bar
		Menu Filemenu = new Menu("_File");
		Menu about = new Menu("_About");
		Menu help = new Menu("_Help");
		MenuBar menubar = new MenuBar();



		//This creating the menu items
		MenuItem item1 = new MenuItem("_Restart");
		MenuItem item2 = new MenuItem("_Exit");
		MenuItem aboutWindow = new MenuItem("About us");
		MenuItem helpWindow = new MenuItem("Help option");

		//This is adding the menu items to the menu
		Filemenu.getItems().add(item1);
		Filemenu.getItems().add(new SeparatorMenuItem());
		Filemenu.getItems().add(item2);
		about.getItems().add(aboutWindow);
		help.getItems().add(helpWindow);

		//clear table method to clear the table after the error has been displayed.
		UnaryOperator<Change> IntegerValue = check  -> {
		String s = check.getText();
		if (s.matches("[0-9]*"))
		{
		 	return check;
		}
			error.showAndWait();
			table.getItems().clear();
			return null;
		};

		textField3.setTextFormatter(new TextFormatter<String>(IntegerValue));





		//These are actions that will be perform when you click on these menuitems
		//Item2 will exit the program
		item2.setOnAction(e -> System.exit(0));
		aboutWindow.setOnAction(e -> aboutAlert.showAndWait());
		helpWindow.setOnAction(e -> helpAlert.showAndWait());

		//This is adding the menu options to the menu bar
		menubar.getMenus().addAll(Filemenu,about,help);


		//These are for choosing the position of where the menu bar will go
		//and where the button, textfields and the table will appear
		pane.setTop(menubar);
		pane.setCenter(table);
		pane.setRight(box);


		//This is adding the scene to the window to be able to display the content
		//Inside the borderpane
		primaryStage.setScene(scene2);

		//This one is setting the window visible
		primaryStage.show();
	}
	public ObservableList<TableSetUp> getTableSetUp()
	{
		//This is an arrayList that you need in order to make the table. You need to have it.
		ObservableList<TableSetUp> TableSetUp = FXCollections.observableArrayList();
		String s;

		//Use This at the bottom to convert the input in the textfield to an integer
		//You can replace the 7, for that piece of code to get the integers.
		//Check to see if it's an integer first or it will give you an error.
		//Integer.parseInt(textField.getText());

		//This line of codes adds another row to the table when you click on the button
		//It takes two strings and 1 integer
		//TableSetUp x = new TableSetUp(textField.getText(), textField2.getText(), Integer.parseInt(textField3.getText()));
		button.setOnAction(action -> TableSetUp.add(new TableSetUp(textField.getText(), textField2.getText(), Integer.parseInt(textField3.getText()), ActivityArray.add(textField.getText()), dependencyArray.add(textField2.getText()), durationArray.add(Integer.parseInt(textField3.getText())))));
		//mainlist.add(x);

		findPath.setOnAction(action -> theGraph());
		/*
		findPath.setOnAction(new EventHandler<ActionEvent>() {
		    @Override public void handle(ActionEvent e) {
		    	for (int i = 0; i< durationArray.size(); i++)
				{
					//System.out.println(dependencyArray.get(i));
					int x = durationArray.get(i);
					System.out.println(x);
					//findPath.setOnAction(action -> System.out.println(x));
				}
		        ;
		    }
		});
		*/
		//Testing

		//This only returns the rows to the GUI on top to be display.
		return TableSetUp;
    }


	public void theGraph() {

		int n = ActivityArray.size();
		LinkedList<Node>[] mainlist = new LinkedList[n];
		DirectedGraph graph = new DirectedGraph(n);



		for(int i = 0; i < n; i++)
		{
			mainlist[i] = new LinkedList<Node>();
		}

		for(int i = 0; i < n; i++) {
			if(dependencyArray.get(i).equals(""))
			{
				Node theNode = new Node(durationArray.get(i), ActivityArray.get(i));
				mainlist[i].add(theNode);
			}

			else if(dependencyArray.get(i).contains(",") == false)
			{
				Node theDep = new Node(durationArray.get(i), ActivityArray.get(i));
				theDep.addPrecessor(dependencyArray.get(i));
				mainlist[i].add(theDep);
			}
			else {
				Node theDep = new Node(durationArray.get(i), ActivityArray.get(i));
				//parse
				String x = dependencyArray.get(i);
				//System.out.println(dependencyArray.get(i));
				x  = x.replaceAll("\\s++", "");
				String[] Dep = x.split(",");
				for(int j = 0; j < Dep.length; j++)
				{
					theDep.addPrecessor(Dep[j] );
				}

				mainlist[i].add(theDep);
				//theDep.addprecessor(String)
			}
		}

		for(int i = 0; i < n; i++)
		{
			//System.out.println(mainlist[i].get(0).getName());
			mainlist[i].get(0).printNodePrecessor(mainlist[i].get(0));
		}

		System.out.println(mainlist[0].get(0).getName().equalsIgnoreCase("A"));




		for(int i = 0; i < mainlist.length; i++)
		{
			if(mainlist[i].get(0) == null)
			{
				i = n;
			}
			else
			{
				graph.addVertices(i, mainlist[i].get(0));
			}


		}

		for(int i = 0; i < mainlist.length; i++)
		{

			  graph.addEdge(mainlist[i].get(0),mainlist[i].get(0).getNodePrecessor());

		}

		graph.printGraph();
		
		graph.test();
		
		graph.printPaths();
		
		graph.printFullPathList();
		
		System.out.println(graph.findingCriticalPath());
		
		graph.sortingPaths();
		
		System.out.println("---------");
		
		graph.printSorted();
		
		
		

	}
}









