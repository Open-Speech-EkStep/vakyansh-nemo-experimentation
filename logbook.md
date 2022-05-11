

06/05/2022:
* Target today: Start Hindi Conformer Small Training on 4k hours of data.
* Had to restart the training 12 times. 
* Funny that the medium model using the same hardware, same data, same batch size was able to run without any cuda OOM but the small model with nearly half the parameters was unable to.
* Final training that went through is with train_batch_size 8 and valid_batch_size 8
* One epoch is 50k steps.


07/05/2022:
* Training on Hindi Small Conformer to continue. Valid WER touched 0.3 in epoch 4 after 200k steps.
* Will train till 400k steps.

08/05/2022:
* Stopped Small Hindi Nemo Conformer CTC training as validation loss/wer didn't improve after 400k iterations.
* Started training transducer based conformer small, BPE. It took 9 attempts to start the training.

09/05/2022:
* Looks like the Transducer based training doesn't likes noisy data and only high quality data should be used for this training. Why? Because even training loss in not decreasing. (2 things here) Try to improve data, or reduce regularization.
