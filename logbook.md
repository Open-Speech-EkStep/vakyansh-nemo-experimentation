

06/05/2022:
* Target today: Start Hindi Conformer Small Training on 4k hours of data.
* Had to restart the training 12 times. 
* Funny that the medium model using the same hardware, same data, same batch size was able to run without any cuda OOM but the small model with nearly half the parameters was unable to.
* Final training that went through is with train_batch_size 8 and valid_batch_size 8
* One epoch is 50k steps.


07/05/2022:
* Training on Hindi Small Conformer to continue. Valid WER touched 0.3 in epoch 4 after 200k steps.
* Will train till 400k steps.
