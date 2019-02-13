function layers = better_basic_cnn_classifier()

layers = [ 
          imageInputLayer([28 28 1])
          convolution2dLayer([5 5],30,'Padding',2,'Stride',1)
          reluLayer
          
          convolution2dLayer([5 5],10,'Padding',2,'Stride',1)
          reluLayer
        
          fullyConnectedLayer(10)
          softmaxLayer
          classificationLayer 
          
         ]

end