package study.likelionbeweekly.week7.post;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.ManyToOne;
import lombok.*;
import study.likelionbeweekly.week7.BaseEntity;
import study.likelionbeweekly.week7.member.Member;

@Getter
@Setter
@Entity
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@AllArgsConstructor(access = AccessLevel.PROTECTED)
public class Post extends BaseEntity {

    @Column(length = 64, nullable = false)
    private String title;

    @Column(length = 512, nullable = false)
    private String content;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    private Member member;
}