import re

a = '''/*****
 * This is a test program with 5 lines of code
 *  \/* no nesting allowed!

//*****//***/// Slightly pathological comment ending...
public class Hello {
    public static final void main(String [] args) { // gotta love Java
        // Say hello
        System./*wait*/out./*for*/println/*it*/("Hello/*");
    }
}'''



#re.match("((?s)/\*.*?\*/)|(\s*//a)"
#re.match("\s*//a")
a = re.sub("(?s)/\*.*?\*/", "", a) 
a = re.sub("^\/\/.*?\n", "", a.strip())
print(a)
