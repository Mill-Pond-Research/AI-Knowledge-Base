# Advancing Multi-Talker ASR Performance with Large Language Models

## Table of Contents

1. Document Overview
2. Introduction
3. Serialized Output Training (SOT)
4. LLM-Based SOT for Multi-Talker ASR
5. Experiments
   5.1. Experiment with LibriMix
   5.2. Experiment with AMI
6. Conclusions
7. References
8. Glossary

## 1. Document Overview

This knowledge base entry is based on the research paper titled "Advancing Multi-Talker ASR Performance with Large Language Models" by Mohan Shi, Zengrui Jin, Yaoxun Xu, Yong Xu, Shi-Xiong Zhang, Kun Wei, Yiwen Shao, Chunlei Zhang, and Dong Yu from Tencent AI Lab, Bellevue, USA. The paper presents a novel approach to improving multi-talker automatic speech recognition (ASR) performance using large language models (LLMs).

The document is significant in the field of speech recognition, particularly for addressing the challenges of recognizing overlapping speech from multiple speakers in conversational scenarios. It proposes an innovative method that leverages the power of LLMs to enhance the performance of multi-talker ASR systems, achieving state-of-the-art results on both simulated and real-world datasets.

## 2. Introduction

<definition>Multi-talker ASR</definition> is one of the most challenging problems in automatic speech recognition, particularly when dealing with overlapping speech in conversational scenarios. The paper introduces a novel approach to address this challenge by combining Serialized Output Training (SOT) with Large Language Models (LLMs).

Key points from the introduction:

- Recognizing overlapping speech from multiple speakers in conversational scenarios is a significant challenge for ASR systems.
- Serialized Output Training (SOT) is a classic method for multi-talker ASR, which concatenates transcriptions from multiple speakers based on their speech emission times.
- SOT-style transcriptions require strong long-context awareness and cross-utterance modeling capabilities.
- The paper proposes leveraging Large Language Models (LLMs) for multi-talker ASR, utilizing their pre-trained capabilities to handle complex and challenging scenarios.

Quote from the introduction:
"Although automatic speech recognition (ASR) [1, 2, 3] has achieved excellent performance in quiet, single-speaker scenarios, it still faces significant challenges in multi-talker conversational scenarios, especially in the case of overlapping speech."

## 3. Serialized Output Training (SOT)

<definition>Serialized Output Training (SOT)</definition> is a method for addressing multi-talker ASR by concatenating transcriptions from multiple speakers according to their speech emission times.

Key features of SOT:

1. Concatenates transcriptions from multiple speakers
2. Uses a speaker change symbol to separate different speakers' transcriptions
3. Follows a first-in-first-out (FIFO) order based on speech emission times

The paper describes SOT as follows:

"During the training stage, the transcriptions of different speakers are concatenated using a speaker change symbol to create the reference transcription for the overlapping speech. The concatenation order follows the emission time of each speaker, known as first-in first-out (FIFO)."

Example of SOT transcription:
"For example, as shown in Fig. 1, in the case of three speakers, the reference transcription Y is given as R = {r11, · · · , r1N1, $, r21, · · · , r2N2, $, r31, · · · , r3N3}, where rji represents the i-th token of the j-th speaker, Nj represents the number of tokens in the j-th speaker, and "$" represents the speaker change symbol."

Advantages of SOT over other methods (e.g., Permutation Invariant Training):
1. Avoids limitations on the maximum number of speakers
2. Models dependencies in multi-talker content
3. Reduces computational complexity

## 4. LLM-Based SOT for Multi-Talker ASR

The paper proposes an LLM-based approach for multi-talker ASR, leveraging the power of large language models to handle SOT-style transcriptions. The architecture consists of three main components:

1. Speech Encoder
2. Projector
3. Large Language Model (LLM)

<definition>Model Architecture</definition>:
"As shown in Fig. 2, the architecture for LLM-based multi-talker ASR mainly consists of a speech encoder, a projector, and an LLM."

Process flow:

1. Speech Encoder: Converts the overlapped speech signal into a speech representation.
   "Hs = Encoder(Solp)"

2. Downsampler: Reduces the length of the speech representation to make it suitable for LLM processing.
   "H̄s = Downsampler(Hs)"

3. Projector: Converts the speech representation into a speech embedding in the same domain as the text embedding.
   "Es = Projector(H̄s)"

4. Text Embedding: Tokenizes and embeds the SOT-style multi-talker transcription.
   "Et = Embedding(Tokenizer(Tmulti))"

5. LLM Processing: Concatenates speech and text embeddings as input to the LLM.
   "T̂multi = LLM(Concat(Es, Et))"

6. Loss Calculation: Uses Cross-Entropy (CE) as the loss function.
   "L = CE(T̂multi, Tmulti)"

The authors note that during inference, only the speech embedding is used as input to the LLM, allowing for auto-regressive inference of the multi-talker transcription.

## 5. Experiments

The paper presents experiments conducted on two datasets:

1. LibriMix: A modified simulated dataset
2. AMI: A real-world meeting scenario dataset

### 5.1. Experiment with LibriMix

<definition>LibriMix</definition>: A simulated dataset obtained by mixing single-speaker speech from LibriSpeech with noise from WHAM!

Dataset details:
- Training set: ~830 hours of speed-perturbed data
- Development set: 8.2 hours
- Test set: 7.6 hours
- All utterances contain two speakers

Evaluation metric: Word Error Rate (WER)

Model configuration:
- Speech Encoder: WavLM (Base+ and Large versions)
- LLM: Vicuna-7B
- Downsampling rate: 10 (resulting in 200 ms frame length)
- Projector: Two linear layers with ReLU activation

Training strategy:
The authors adopted a multi-stage training strategy:
1. Train projector
2. Train speech encoder (if not frozen)
3. Fine-tune LLM using LoRA

Results:
The LLM-based approach achieved the best performance on LibriMix, with a WER of 9.0% on the test set (Table 1, System 8).

Key findings:
1. LLM-based method outperforms AED-based method when using WavLM Base+ as the speech encoder.
2. AED-based method shows significant performance boost with WavLM Large encoder.
3. Initializing the LLM-based system with a fine-tuned speech encoder yields the best performance.
4. Introducing LoRA fine-tuning consistently improves performance.
5. Multi-stage training outperforms single-stage training.

### 5.2. Experiment with AMI

<definition>AMI</definition>: A real-world meeting corpus containing approximately 95 hours of recordings.

Dataset details:
- Training set: 76.9 hours
- Validation set: 8.9 hours
- Evaluation set: 8.7 hours
- Each meeting involves 3 to 5 participants

Evaluation metrics:
1. Word Error Rate (WER)
2. Concatenated minimum-permutation word error rate (cpWER)

Experimental setup:
- Used the Single Distant Microphone (SDM) setting
- Evaluated on "utterance groups" (sets of utterances connected by speaker overlap regions)

Results:
The LLM-based approach achieved state-of-the-art performance on the AMI-SDM evaluation set, outperforming previous methods trained on much larger datasets.

Key findings:
1. LLM-based method (System 5, Table 5) outperforms AED-based method using the same amount of data (System 4, Table 5).
2. LLM-based method surpasses models trained with large-scale supervised data (Systems 1-3, Table 5).
3. The proposed approach achieves better performance in complex scenarios involving multi-talker conversations with noise and reverberation.

Quote from the results:
"It is worth mentioning that Sys. 1 in Table 5 was trained using 900k hours of supervised data, which is 1000 times more than what we used. This demonstrates that for SOT-based multi-talker ASR task, having a robust, large-scale pre-trained decoder is more important, as it provides strong capabilities in long-context awareness and cross-utterance modeling."

## 6. Conclusions

The paper presents several important conclusions:

1. The proposed LLM-based multi-talker ASR approach achieves state-of-the-art results on both simulated (LibriMix) and real-world (AMI) datasets.
2. LLM-based architectures outperform AED-based structures in SOT-based multi-talker ASR tasks, particularly in complex and challenging scenarios.
3. The advantage of LLM-based models is more pronounced on real data (AMI) compared to simulated data (LibriMix), highlighting their potential in handling speech processing tasks in complex scenarios.
4. The proposed method outperforms existing approaches trained with significantly more supervised data, demonstrating the power of leveraging pre-trained LLMs for multi-talker ASR.

Quote from the conclusions:
"The experimental results demonstrate that LLM-based architectures, which emphasize decoder performance and possess strong capabilities in understanding long contexts and modeling across utterances, outperform AED-based structures that focus more on encoder performance in SOT-based multi-talker ASR task."

## 7. References

The paper includes an extensive list of references, which can be found at the end of the document. Some key references include:

[1] J. Li et al., "Recent advances in end-to-end automatic speech recognition," APSIPA Transactions on Signal and Information Processing, vol. 11, no. 1, 2022.

[8] N. Kanda, Y. Gaur, X. Wang, Z. Meng, and T. Yoshioka, "Serialized output training for end-to-end overlapped speech recognition," in INTERSPEECH. ISCA, 2020, pp. 2797–2801.

[13] T. L. Scao et al., "BLOOM: A 176b-parameter open-access multilingual language model," CoRR, vol. abs/2211.05100, 2022.

[25] S. Chen et al., "Wavlm: Large-scale self-supervised pre-training for full stack speech processing," IEEE J. Sel. Top. Signal Process., vol. 16, no. 6, pp. 1505–1518, 2022.

## 8. Glossary

<definition>Automatic Speech Recognition (ASR)</definition>: The technology that enables the recognition and translation of spoken language into text by computers.

<definition>Multi-talker ASR</definition>: A challenging task in speech recognition that involves recognizing speech from multiple speakers, often with overlapping speech.

<definition>Serialized Output Training (SOT)</definition>: A method for multi-talker ASR that concatenates transcriptions from multiple speakers according to their speech emission times.

<definition>Large Language Model (LLM)</definition>: A type of artificial intelligence model trained on vast amounts of text data, capable of understanding and generating human-like text.

<definition>Attention-based Encoder-Decoder (AED)</definition>: A neural network architecture commonly used in sequence-to-sequence tasks, including speech recognition.

<definition>Word Error Rate (WER)</definition>: A common metric for evaluating speech recognition performance, measuring the edit distance between the recognized text and the reference transcription.

<definition>Concatenated minimum-permutation word error rate (cpWER)</definition>: An evaluation metric for multi-talker ASR that accounts for speaker permutations in the transcriptions.

<definition>LibriMix</definition>: A simulated dataset created by mixing single-speaker speech from LibriSpeech with noise from WHAM!, used for evaluating multi-talker ASR systems.

<definition>AMI Corpus</definition>: A real-world meeting corpus used for evaluating speech recognition systems in multi-speaker scenarios.

<definition>LoRA (Low-Rank Adaptation)</definition>: A technique for efficiently fine-tuning large language models by introducing trainable low-rank matrices.