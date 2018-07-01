The data set given is a tidy version of a data set from an experiment on 30 subject, 
doing several activities (Walking, Walking Upstairs, Walking Downstairs, Standing, Sitting, Lying) 
and carrying a Samsung Galaxy S II Smartphone.

The raw data comes from 6 sensors :
  3 Acclerometers (X, Y, Z) that give linear acceleration
  3 Gyroscope (X,Y,Z) that give rotational acceleration
  
This data has been either kept in the time Domain (preffix Time) Or derivated (preffix Frequency Domain)
With filters, the variables have been split into 2 gorups : The Acceleration (linear or rotational) from the Body or from the Gravity
By derivating the Acceleration and the rotational acceleration, A new variables has been determined : The jerk.
Using the euclidian norms, the Magnitude (Mag) has also been calculated

Each of this groups and subgroups of variables has its mean and its standard deviation (std)

For Example : Time.Gravity.Acceleration.mean-z
This variable is the mean on the time domain of the linear Acceleration driven by the gravity on the Z axis 
