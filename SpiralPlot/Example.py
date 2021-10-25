# 21-10-25
# onlybugs
# Coding ATGC

import random

class Seq(object):

    def __init__(self,length) -> None:
        self.__atgc = ['A',"T","G","C"]
        self.length = length
        self.seq = ""
        self.bag = length//10
        self.GenerateSeq()

    def GenerateSeq(self):
        for i in range(self.length):
            ri = random.randint(0,3)
            self.seq += self.__atgc[ri]
    
    def GeneratePd(self):
        txt = ""
        bag = self.bag
        G = 1
        site = 1
        for i in range(self.length):
            if(bag == 0):
                bag = self.bag
                site = 1
                G += 1
            txt = txt + "\n" + str(G)+ "\t" + str(site) + "\t" + self.seq[i]
            site += 1
            bag -= 1
        return txt
            


def main():
    seq = Seq(1000)
    out = seq.GeneratePd()
    with open("test.tb","w") as f:
        f.write(out)

main()
