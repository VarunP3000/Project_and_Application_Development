public class BinaryTree<E extends Comparable <E>> {
    private TreeNode overallRoot;
    int size;

    public BinaryTree(){
        size = 0;
        overallRoot = null;
    }

    public void add(E card){
        if(overallRoot == null){
            overallRoot = new TreeNode(card);
        } else {
            addHelp(card, overallRoot);
        }
        this.size++;
    }

    private void addHelp(E card, TreeNode c){
        if (card.compareTo(c.data)<0) {
            if (c.left != null) {
                addHelp(card, c.left);
            } else {
                c.left = new TreeNode(card);
            }
        } else {
            if (c.right != null) {
                addHelp(card, c.right);
            } else {
                c.right = new TreeNode(card);
            }
        }
    }

    public boolean find(E card){
        return find(card, overallRoot);
    }

    private boolean find(E card, TreeNode c){
        if(c == null) {
            return false;
        }
        if (card.compareTo(c.data)<0) {
            return find(card, c.left);
        } else if (card.compareTo(c.data)>0) {
            return find(card, c.right);
        }
        return true;
    }

    public void remove(E card){
        if (overallRoot != null) {
            overallRoot = deleteRecursively(overallRoot, card);
        }
    }

    public TreeNode deleteRecursively(TreeNode c, E card) {
        if (c == null)
            return c;
        if (card.compareTo(c.data)< 0) {
            c.left = deleteRecursively(c.left, card);
        } else if (card.compareTo(c.data)> 0) {
            c.right = deleteRecursively(c.right, card);
        } else {
            if (c.left == null) {
                this.size--;
                return c.right;
            } else if (c.right == null) {
                this.size--;
                return c.left;
            }
            c.data = inOrderSuccessor(c.right);
            c.right = deleteRecursively(c.right, c.data);
        }

        return c;

    }
    public E inOrderSuccessor(TreeNode root) {
        E minimum = root.data;
        while (root.left != null) {
            minimum = root.left.data;
            root = root.left;
        }
        return minimum;
    }

    public boolean isEmpty(){
        return size==0;
    }

    public String toString() {
        StringBuilder res = new StringBuilder();
        dfs(overallRoot, res);
        return res.toString();
    }

    public void dfs(TreeNode t, StringBuilder res) {
        if (t == null)
            return;
        res.append(String.valueOf(t.data));
        res.append(' ');
        if (t.left == null && t.right == null)
            return;
        dfs(t.left, res);
        if (t.right != null) {
            dfs(t.right, res);
        }
    }

    class TreeNode {
        E data;
        TreeNode left;
        TreeNode right;

        public TreeNode(E data){
            this(data, null, null);
        }

        public TreeNode(E data, TreeNode left, TreeNode right) {
            this.data = data;
            this.left = left;
            this.right = right;
        }
    }
}