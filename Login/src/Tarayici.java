import java.awt.Button;
import java.awt.Container;
import java.awt.TextField;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.io.IOException;
import java.net.URL;

import javax.swing.JEditorPane;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.event.HyperlinkEvent;
import javax.swing.event.HyperlinkListener;


public class Tarayici extends JFrame implements
ActionListener,HyperlinkListener
{
	private JEditorPane webs;
	private JScrollPane kay;
	private JMenuBar menubar;
	private JMenu menu,hakkimda;
	private JMenuItem menukapa;
	private Button kapat;
	private Button yazdir;
	private Button dugme;
	private TextField kutu;
	private URL url;

	public Tarayici()
	{

		super("Tarayici");
		setSize(950,700);

		Container c=getContentPane();

		dugme=new Button("Git");
		dugme.addActionListener(this);

		menubar=new JMenuBar();
		menu=new JMenu("Dosya");
		hakkimda=new JMenu("Hakk²mda");
		hakkimda.addActionListener(this);
		menukapa=new JMenuItem("Ã²k²¦");
		menukapa.addActionListener(this);

		menu.add(menukapa);
		menubar.add(menu);
		menubar.add(hakkimda);

		kapat=new Button("Kapat");
		kapat.addActionListener(this);

		yazdir=new Button("Geri");
		yazdir.addActionListener(this);


		kutu=new TextField("http://www.");
		kutu.addActionListener(this);

		webs=new JEditorPane();
		webs.setEditable(false);
		webs.addHyperlinkListener(this);

		setJMenuBar(menubar);
		c.setLayout(null);

		kay=new JScrollPane(webs);

		kay.setBounds(10,50,940,650);
		kutu.setBounds(10,20,740,25);
		dugme.setBounds(751,20,50,25);
		kapat.setBounds(803,20,50,25);
		yazdir.setBounds(855,20,50,25);

		c.add(kapat);
		c.add(kay);
		c.add(dugme);
		c.add(yazdir);
		c.add(kutu);
		show();
		}

	public void actionPerformed(ActionEvent e)
	{
		setTitle("Kachak Web Tarayici - Site Aþ²l²yor...");
		setCursor(Cursor.getPredefinedCursor(Cursor.WAIT_CURSOR));

		Object kaynak=e.getSource();
		String satir=kutu.getText();

		if (kaynak==dugme || kaynak==kutu)
		{
			try {
				webs.setPage(satir);
				setTitle("Kachak Web Tarayici - Aþ²ld²");

			}
			catch (IOException ei)
			{
				try {
				webs.setPage("http://www.cmaeal.com/hata/hata.html");
				kutu.setText("hata: sayfaYok");

				}
				catch (IOException se) {
					System.out.print("Hata oldu..");
				}
			}
		}
		else if (kaynak==kapat)
		{
			System.exit(0);
		}

		else if (kaynak==hakkimda)
		{
		JOptionPane.showMessageDialog( this,"S³r³m 1.0","Yazan: CanÍKÃELIK",JOptionPane.INFORMATION_MESSAGE );

		}

		else if (kaynak==menukapa)
		{
			System.exit(0);
		}

		else if (kaynak==yazdir)
		{
			webs.setPage((String)yazdir.getEditor().getItem());
		}
	}

	public void hyperlinkUpdate( HyperlinkEvent ea )
	{
		if ( ea.getEventType() ==
		HyperlinkEvent.EventType.ACTIVATED )
	{
	     try {
			webs.setPage( ea.getURL().toString() );
			kutu.setText(ea.getURL().toString());
		}
		catch (IOException ei)
		{
				try {
				webs.setPage("http://www.cmaeal.com/hata/hata.html");
				kutu.setText("hata: sayfaYok");
				}
				catch (IOException se) {
					System.out.print("Hata oldu..");
				}

			}
		}
	}


	public static void main(String[] args)
	{
		Tarayici t=new Tarayici();
		t.setVisible(true);
	}


}


