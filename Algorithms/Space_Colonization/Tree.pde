class Tree {
  ArrayList<Leaf> leaves;
  ArrayList<Branch> branches;

  public Tree(int num) {
    leaves = new ArrayList<Leaf>();
    branches = new ArrayList<Branch>();

    for (int i = 0; i < num; ++i) {
      leaves.add(new Leaf());
    }

    PVector p = new PVector(0, height /2);
    PVector d = new PVector(0, -1);
    Branch root = new Branch(null, p, d);
    branches.add(root);

    Branch current = root;

    boolean found = false;

    while (!found) {
      for (int i = 0; i < leaves.size(); ++i) {
        float dist = PVector.dist(current.p, leaves.get(i).p);
        if (dist < max_dist) {
          found = true;
        }
      }

      if (!found) {
        Branch branch = current.next();
        current = branch;
        branches.add(branch);
      }
    }
  }

  void grow() {
    for (Leaf l : leaves) {  
      Branch closest = null;
      float record = 100000;
      for (Branch b : branches) {
        float d = PVector.dist(l.p, b.p);
        if (d < min_dist) {
          l.reached = true;
          closest = null;
          break;
        } else if (d > max_dist) {
          continue;
        } else if (closest == null || d < record) {
          closest = b;
          record = d;
        }
      }
      
      if (closest != null) {
        PVector new_dir = PVector.sub(l.p, closest.p);
        new_dir.normalize();
        closest.dir.add(new_dir);
        closest.count++;
      }
    }
    
    for(int i = leaves.size() - 1; i >= 0; --i) {
       if(leaves.get(i).reached) {
         leaves.remove(i);
       }
    }
    
    for(int i = branches.size() - 1; i >= 0; --i) {
        Branch b = branches.get(i);
        if (b.count > 0) {
          b.dir.div(b.count);
          branches.add(b.next());
          b.reset();
        }
    }
  }

  void draw() {
    for (Leaf l : leaves) {
      l.draw();
    }

    for (int i = 0; i < branches.size(); ++i) {
      float sw = map(i, 0, branches.size(), 4, 0);
      println(sw);
      strokeWeight(sw);
      branches.get(i).draw();
    }
  }
}
