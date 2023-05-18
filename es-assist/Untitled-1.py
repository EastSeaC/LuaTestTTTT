from tkinter import *

root = Tk()

text = Text(root)
text.pack()

# 创建tag
text.tag_configure("red", foreground="red")
text.tag_configure("blue", foreground="blue")

# 插入带有tag的文本
text.insert(END, "这是红色文字\n", "red")
text.insert(END, "这是蓝色文字", "blue")
text.insert(END, "这是红色文字\n", "red")

root.mainloop()
