# # %%
# import cv2 as cv
# import sys
# img = cv.imread("lena.tif")
# if img is None:
#     sys.exit("Could not read the image.")
# cv.imshow("Display window", img)
# k = cv.waitKey(0)

# # %%
# from __future__ import absolute_import, division, print_function, unicode_literals

# # Tensorflow imports
# import tensorflow as tf
# print("Tensorflow version: " + tf.__version__)
# from tensorboard.plugins.hparams import api as hp
# # Comment below in order to run on CPU
# physical_devices = tf.config.experimental.list_physical_devices('GPU')
# assert len(physical_devices) > 0, "Not enough GPU hardware devices available"
# tf.config.experimental.set_memory_growth(physical_devices[0], True)


# %%
import numpy as np
import matplotlib 
matplotlib.use('Qt5Agg')
import matplotlib.pyplot as plt
plt.ion()

# %%
I = np.eye(25, dtype="int8")
plt.figure()
plt.imshow(2*I)
figManager = plt.get_current_fig_manager()
figManager.window.showMaximized()
plt.show()


# %%
# import sys
# from PyQt5 import QtCore, QtWidgets
# from PyQt5.QtWidgets import QMainWindow, QLabel, QGridLayout, QWidget
# from PyQt5.QtCore import QSize    

# class HelloWindow(QMainWindow):
#     def __init__(self):
#         QMainWindow.__init__(self)

#         self.setMinimumSize(QSize(640, 480))    
#         self.setWindowTitle("Hello world - pythonprogramminglanguage.com") 

#         centralWidget = QWidget(self)          
#         self.setCentralWidget(centralWidget)   

#         gridLayout = QGridLayout(self)     
#         centralWidget.setLayout(gridLayout)  

#         title = QLabel("Hello World from PyQt", self) 
#         title.setAlignment(QtCore.Qt.AlignCenter) 
#         gridLayout.addWidget(title, 0, 0)

# if __name__ == "__main__":
#     app = QtWidgets.QApplication(sys.argv)
#     mainWin = HelloWindow()
#     mainWin.show()
#     sys.exit( app.exec_() )


# %%
