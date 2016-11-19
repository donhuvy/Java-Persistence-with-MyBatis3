package com.mybatis3.mappers;

import com.mybatis3.domain.Tutor;

public interface TutorMapper {

    Tutor selectTutorWithCourses(int tutorId);

    Tutor selectTutorById(int tutorId);

}
