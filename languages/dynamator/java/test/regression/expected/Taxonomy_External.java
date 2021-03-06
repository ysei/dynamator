// generated by Dynamator Mon Mar 29 22:08:54 CST 2004

import java.io.PrintWriter;

public
class Taxonomy_External
{
    static
    class Element
    {
        private String name_;
        private Element[] children_ = {};
        
        public
        Element(
            String name
            )
        {
            name_ = name;
        }

        public
        Element(
            String name,
            Element[] children
            )
        {
            name_ = name;
            children_ = children;
        }

        public
        String
        name()
        {
            return name_;
        }
        
        public
        Element[] 
        children()
        {
            return children_;
        }
    }

    private static Element root = 
        new Element("Animals",
            new Element[]
            {
                new Element("Vertebrates",
                    new Element[]
                    {
                        new Element("Warm-blooded",
                            new Element[]
                            {
                                new Element("Mammals"),
                                new Element("Birds")
                            }
                        ),
                        new Element("Cold-blooded",
                            new Element[]
                            {
                                new Element("Fish"),
                                new Element("Reptiles")
                            }
                        )
                    }
                ),
                new Element("Invertebrates",
                    new Element[]
                    {
                        new Element("Arthropods",
                            new Element[]
                            {
                                new Element("Crustaceans"),
                                new Element("Insects")
                            }
                        )
                    }
                )
            }
        );
    
    public static void main(String[] args)
    {
        PrintWriter out = new PrintWriter(System.out);
        print(out, root);
        out.flush();
    }

    private static
    void
    print(
        PrintWriter out,
        Element element
        )
    {
        
        out.write("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\n");
        out.write("<html>\n");
        out.write("  <head>\n");
        out.write("    <title>Taxonomy</title>\n");
        out.write("  </head>\n");
        out.write("  <body>\n");
        out.write("    <h1 id=\"title\">");
            out.write(String.valueOf("An informal Taxonomy of the Animal Kingdom"));
            out.write("</h1>\n");
        out.write("    <p id=\"root\">");
            out.write(String.valueOf(element.name()));
            out.write("</p>\n");

      Taxonomy_External_TreeWriter.printChildren(out, element);
            out.write("  </body>\n");
        out.write("</html>\n");

    }
}
