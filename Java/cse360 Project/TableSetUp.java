import javafx.application.Application;
import javafx.event.ActionEvent;
import javafx.event.EventHandler;
import javafx.scene.Scene;
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


public class TableSetUp
{
	//This is declaring the three things that will be display at the table
	//The rest are your normal getters and setters nothing fancy
	private String name;
	private String dependency;
	private int duration;

	public TableSetUp()
	{
		this.name = "";
		this.dependency = "";
		this.duration = 0;
	}
	public TableSetUp(String name, String dependency, int duration)
	{
		this.name = name;
		this.dependency = dependency;
		this.duration = duration;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getDependency()
	{
		return dependency;
	}
	public void setDependency(String dependency)
	{
		this.dependency = dependency;
	}
	public int getDuration()
	{
		return duration;
	}
	public void setDuration(int duration)
	{
		this.duration = duration;
	}

}