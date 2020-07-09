package com.project.bit.chat.domain;

import lombok.*;

import java.util.Date;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Message {
  private String type;
  private int messageId;
  private String authorId;
  private String conversationId;
  private String content;
  private Date creationTime;
  private List<Participation> participations;

  @Builder
  public Message(String authorId, String conversationId, String content) {
    this.authorId = authorId;
    this.conversationId = conversationId;
    this.content = content;
  }

}
